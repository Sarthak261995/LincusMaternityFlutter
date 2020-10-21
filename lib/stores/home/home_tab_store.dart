import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/pregnancy/pregnancy_details.dart';
import 'package:lincus_maternity/models/pregnancy/response/get_pregnancy_detail_response.dart';
import 'package:lincus_maternity/models/wellbeing/response/get_wellbeing_score_response.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

import '../locator.dart';
part 'home_tab_store.g.dart';

class HomeTabStore = HomeTabStoreBase with _$HomeTabStore;

abstract class HomeTabStoreBase with Store {
  List<ReactionDisposer> _disposers;

  String errorText = "";

  @observable
  bool showError;

  @observable
  bool isBusy = false;

  PreferencesService preferencesService;
  ApiService apiService;

  @observable
  ObservableFuture<GetWellbeingScoreResponse> getWellbeingScoreFuture;

  @observable
  PregnancyDetails getPregnancyDetailResult;

  @observable
  ObservableFuture<GetPregnancyDetailResponse> getPregnancyDetailResponseFuture;

  @observable
  String wellbeingScore = '';

  @observable
  double wellbeingProgress = 0;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  @observable
  String lastUpdateDateWellbeingScore = '';

  @observable
  String weekNumber = '';

  @observable
  String sizeText = '';

  @observable
  String dueDate = '';

  @observable
  String trimester = '';

  @observable
  String gender = '';

  CurrentUser get currentUser => AppLocator.current_user;

  HomeTabStoreBase(this.preferencesService, this.apiService);

  @action
  Future<GetWellbeingScoreResponse> getWellbeingScore() async {
    try {
      var wellbeingResponse = await apiService.getWellbeingScore();
      if (wellbeingResponse != null && wellbeingResponse.status == 200) {
        currentUser.wellBeingScore = wellbeingResponse.data;
        wellbeingScore =
            '${wellbeingResponse.data.wellbeingScore.toString()}/10';
        lastUpdateDateWellbeingScore = wellbeingResponse.data.lastDate;
        if (wellbeingResponse.data.wellbeingScore > 0 ?? false) {
          wellbeingProgress = wellbeingResponse.data.wellbeingScore / 10;
        }
        //getWellbeingScoreFuture =
        //ObservableFuture<GetWellbeingScoreResponse>.value(
        //wellbeingResponse);
        //await Future<void>.delayed(Duration(seconds: 1));
        return Future<GetWellbeingScoreResponse>.value(wellbeingResponse);
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
  Future<GetPregnancyDetailResponse> getPregnancyDetails() async {
    try {
      var pregnancyDetailsResponse = await apiService.getPregnancyDetails();
      if (pregnancyDetailsResponse != null &&
          pregnancyDetailsResponse.status == 200 &&
          pregnancyDetailsResponse.data != null) {
        currentUser.pregnancyDetails = pregnancyDetailsResponse.data;
        getPregnancyDetailResult = pregnancyDetailsResponse.data;

        if (pregnancyDetailsResponse.data?.additionalInfo?.weekDevelopment !=
                null ??
            false) {
          weekNumber =
              'Week ${pregnancyDetailsResponse.data.additionalInfo.weekDevelopment.weekNumber}';
          sizeText = pregnancyDetailsResponse
                  ?.data?.additionalInfo?.weekDevelopment?.sizeText ??
              '';
          gender = pregnancyDetailsResponse?.data?.gender ?? '';
          trimester = pregnancyDetailsResponse?.data?.additionalInfo?.trimester
                  ?.toString() ??
              '';
          dueDate = pregnancyDetailsResponse?.data?.expected ?? '';
        }
        return Future<GetPregnancyDetailResponse>.value(
            pregnancyDetailsResponse);
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
  void initialiseWellbeingScore() {
    getWellbeingScoreFuture = ObservableFuture(getWellbeingScore());
  }

  @action
  void initialisePregnancyDetails() {
    getPregnancyDetailResponseFuture = ObservableFuture(getPregnancyDetails());
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
