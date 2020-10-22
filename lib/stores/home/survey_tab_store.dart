import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/survey/response/get_available_survey_response.dart';
import 'package:lincus_maternity/models/survey/survey_model.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

import '../locator.dart';
part 'survey_tab_store.g.dart';

class SurveyTabStore = SurveyTabStoreBase with _$SurveyTabStore;

abstract class SurveyTabStoreBase with Store {
  List<ReactionDisposer> _disposers;

  String errorText = "";

  @observable
  bool showError;

  @observable
  bool isBusy = false;

  @observable
  bool isInitialised = false;

  PreferencesService preferencesService;
  ApiService apiService;

  @observable
  ObservableFuture<GetAvailableSurveyResponse> getAvailableSurveyFuture;

  @observable
  ObservableList<SurveyModel> availableSurveyList =
      ObservableList<SurveyModel>();

  @observable
  String weekNumber = AppLocator.home_tab_store.weekNumber;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  CurrentUser get currentUser => AppLocator.current_user;

  SurveyTabStoreBase(this.preferencesService, this.apiService);

  @action
  Future<GetAvailableSurveyResponse> getAvailableSurvey() async {
    try {
      var availableSurveyResponse = await apiService.getAvailableSurvey();
      if (availableSurveyResponse != null &&
          availableSurveyResponse.status == 200) {
        isInitialised = true;
        AppLocator.current_user.availableSurvey = availableSurveyResponse.data;
        if (availableSurveyResponse.data != null) {
          availableSurveyList.clear();
          availableSurveyResponse.data
              .forEach((element) => availableSurveyList.add(element));
        }
        return Future<GetAvailableSurveyResponse>.value(
            availableSurveyResponse);
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
  void initialiseGetAvailableSurvey() {
    weekNumber = AppLocator.home_tab_store.weekNumber;
    getAvailableSurveyFuture = ObservableFuture(getAvailableSurvey());
  }

  void dispose() {
    if (_disposers != null) {
      for (final d in _disposers) {
        d();
      }
    }
  }

  @action
  void resetShowError() {
    showError = null;
    errorText = "";
  }
}
