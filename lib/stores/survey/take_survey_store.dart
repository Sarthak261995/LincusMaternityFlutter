import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/measurement/request/update_measurement_request.dart';
import 'package:lincus_maternity/models/survey/response/get_survey_detail_response.dart';
import 'package:lincus_maternity/models/survey/survey_model.dart';
import 'package:lincus_maternity/models/survey/survey_question.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:mobx/mobx.dart';
import 'dart:core';
part 'take_survey_store.g.dart';

class TakeSurveyStore = TakeSurveyStoreBase with _$TakeSurveyStore;

abstract class TakeSurveyStoreBase with Store {
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

  String note = "";

  SurveyModel surveyModel;

  @observable
  ObservableFuture<GetSurveyDetailResponse> getSurveyDetailFuture;

  @observable
  ObservableList<SurveyQuestions> surveyQuestionList =
      ObservableList<SurveyQuestions>();

  @observable
  String weekNumber = AppLocator.home_tab_store.weekNumber;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  CurrentUser get currentUser => AppLocator.current_user;
  TakeSurveyStoreBase(this.preferencesService, this.apiService);

  @action
  Future<GetSurveyDetailResponse> getSurveyDetail() async {
    try {
      var surveyDetailsResponse =
          await apiService.getSurveyDetail(surveyModel.id.toString());
      if (surveyDetailsResponse != null &&
          surveyDetailsResponse.status == 200) {
        AppLocator.current_user.surveyDetail = surveyDetailsResponse.data;
        if (surveyDetailsResponse.data != null &&
            surveyDetailsResponse.data.questions != null) {
          surveyQuestionList.clear();
          surveyDetailsResponse.data.questions
              .forEach((element) => surveyQuestionList.add(element));
        }
        return Future<GetSurveyDetailResponse>.value(surveyDetailsResponse);
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
      var request = getUpdateValueMeasurementRequest();
      var updateResponse = await apiService.updateMeasurement(request);
      if (updateResponse != null &&
          (updateResponse.status == 200 || updateResponse.status == 201)) {
        result = true;
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
    note = '';
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
  void initialiseGetSurveyDetails() {
    getSurveyDetailFuture = ObservableFuture(getSurveyDetail());
  }

  UpdateMeasurementRequest getUpdateValueMeasurementRequest() {
    var request = new UpdateMeasurementRequest();
    /*
    request.latitude = 0.0;
    request.longitude = 0.0;
    request.comment = note;
    request.photofilename = '';
    request.datetime =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    request.appTimestamp =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    var measurementList = new List<UpdateMeasurementModel>();
    measurementOptionList.forEach((element) {
      if (element.value != null && element.value.isNotEmpty) {
        measurementList.add(UpdateMeasurementModel(
            type: element.id, value: double.parse(element.value)));
      }
    });
    request.measurements = measurementList; */
    return request;
  }

  @action
  bool validateValueUpdate() {
    bool result = true;
    String errorText;
    int valueCount = 0;
    /*measurementOptionList.forEach((element) {
      if (element.value != null && element.value.isNotEmpty) {
        valueCount++;
      }
    }); */
    if (valueCount == 0) {
      result = false;
      errorText = 'Enter atleast one measurement';
    }
    if (errorText != null) {
      alertMessage = errorText;
      alertTitle = 'Error';
      showAlert = true;
    }
    return result;
  }
}
