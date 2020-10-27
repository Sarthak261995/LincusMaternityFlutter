import 'package:lincus_maternity/models/birthplan/birthplan_question_details.dart';
import 'package:lincus_maternity/models/birthplan/request/save_birthplan_question_model.dart';
import 'package:lincus_maternity/models/birthplan/response/get_birthplan_question_response.dart';
import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:mobx/mobx.dart';
import 'dart:core';
part 'create_birthplan_store.g.dart';

class CreateBirthplanStore = CreateBirthplanStoreBase
    with _$CreateBirthplanStore;

abstract class CreateBirthplanStoreBase with Store {
  PreferencesService preferencesService;
  ApiService apiService;

  String errorText = "";

  @observable
  bool showError;

  @observable
  bool showAlert;

  String alertTitle = '';

  String alertMessage = '';

  @observable
  bool isBusy = false;

  @observable
  ObservableFuture<GetBirthplanQuestionResponse> getBirthplanQuestionFuture;

  @observable
  ObservableList<BirthplanQuestionDetails> birthplanDetailsList =
      ObservableList<BirthplanQuestionDetails>();

  @observable
  String weekNumber = AppLocator.home_tab_store.weekNumber;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  CurrentUser get currentUser => AppLocator.current_user;
  CreateBirthplanStoreBase(this.preferencesService, this.apiService);

  @action
  Future<GetBirthplanQuestionResponse> getBirthplanQuestion() async {
    try {
      var birthplanQuestionResponse = await apiService.getBirthplanQuestion();
      if (birthplanQuestionResponse != null &&
          birthplanQuestionResponse.status == 200) {
        AppLocator.current_user.getBirthplanQuestionResponse =
            birthplanQuestionResponse;
        if (birthplanQuestionResponse.data != null) {
          birthplanDetailsList.clear();
          birthplanQuestionResponse.data
              .forEach((element) => birthplanDetailsList.add(element));
        }
        return Future<GetBirthplanQuestionResponse>.value(
            birthplanQuestionResponse);
      }
    } on FetchDataException {
      errorText = 'No Internet connection';
      showError = true;
      return Future.error("No Internet connection",
          StackTrace.fromString("No Internet connection"));
    } catch (e) {
      errorText = 'Something went wrong';
      //showError = true;
    } finally {}
    return Future.error("Could not connect to server",
        StackTrace.fromString("Could not connect to server"));
  }

  @action
  Future<bool> tryUpdateValue() async {
    bool result = false;
    try {
      var request = getSaveBirthplanRequest();
      var updateResponse = await apiService.submitBirthplan(request);
      if (updateResponse != null &&
          (updateResponse.status == 200 || updateResponse.status == 201)) {
        result = true;
      } else if (updateResponse != null && (updateResponse.status == 500)) {
        alertMessage = updateResponse.message;
        alertTitle = 'Error';
      }
    } on FetchDataException {
      errorText = 'No Internet connection';
      showError = true;
    } catch (e) {
      errorText = 'Something went wrong. Please try again';
      showError = true;
    } finally {}
    return Future<bool>.value(result);
  }

  List<ReactionDisposer> _disposers;

  void dispose() {
    if (_disposers != null) {
      for (final d in _disposers) {
        d();
      }
    }
  }

  @action
  void clear_data() {
    showAlert = null;
    alertTitle = "";
    alertMessage = "";
  }

  @action
  void resetShowError() {
    showError = null;
    errorText = "";
  }

  @action
  void resetAlertData() {
    showAlert = null;
    alertTitle = "";
    alertMessage = "";
  }

  @action
  void initialiseGetBirthplanQuestion() {
    getBirthplanQuestionFuture = ObservableFuture(getBirthplanQuestion());
  }

  List<SaveBirthplanQuestionModel> getSaveBirthplanRequest() {
    var request = new List<SaveBirthplanQuestionModel>();
    birthplanDetailsList.forEach((element) {
      var model = new SaveBirthplanQuestionModel();
      model.questionId = element.id;
      model.textarea = element.comment;
      model.checked =
          element.selectedIndex == -1 ? null : element.selectedIndex;
      request.add(model);
    });
    return request;
  }

  @action
  bool validateValueUpdate() {
    bool result = true;
    String errorText;
    if (birthplanDetailsList.length == 0) {
      result = false;
      errorText = 'No birthplan question found.';
    }
    if (errorText != null) {
      alertMessage = errorText;
      alertTitle = 'Error';
      showAlert = true;
    }
    return result;
  }
}
