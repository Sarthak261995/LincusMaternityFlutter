import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/helper.dart';
import 'package:lincus_maternity/models/survey/request/save_survey_request.dart';
import 'package:lincus_maternity/models/survey/response/get_survey_detail_response.dart';
import 'package:lincus_maternity/models/survey/survey_answers.dart';
import 'package:lincus_maternity/models/survey/survey_model.dart';
import 'package:lincus_maternity/models/survey/survey_question.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:mobx/mobx.dart';
import 'dart:core';
import 'package:intl/intl.dart';
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
  Future<bool> trySaveSurvey() async {
    bool result = false;
    try {
      var request = getSaveSurveyRequest();
      var updateResponse = await apiService.saveSurvey(request);
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

  SaveSurveyRequest getSaveSurveyRequest() {
    var request = new SaveSurveyRequest(
        score: 0,
        actionTitle: '',
        actionNote: '',
        actionStatus: 'in_progress',
        actionPriority: 1);
    request.survey = surveyModel.id;
    request.latitude = 0.0;
    request.longitude = 0.0;
    request.comment = note;
    request.datetime =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    //request.appTimestamp =
    //'${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    request.appTimestamp =
        new DateFormat('yyyy-MM-dd HH:mm:ss').format(new DateTime.now());
    request.actionDue = new DateFormat('yyyy-MM-dd').format(new DateTime.now());
    var answers = new List<SurveyAnswers>();
    surveyQuestionList.forEach((element) {
      if (element.id != null && element.start != null) {
        answers.add(SurveyAnswers(question: element.id, answer: element.start));
      }
    });
    request.answers = answers;
    return request;
  }

  @action
  bool validateSaveSurvey() {
    bool result = true;
    String errorText;
    if (surveyQuestionList.length == 0) {
      result = false;
      errorText = 'No question found.';
    }
    if (errorText != null) {
      alertMessage = errorText;
      alertTitle = 'Error';
      showAlert = true;
    }
    return result;
  }
}
