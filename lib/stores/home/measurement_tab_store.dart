import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/measurement/measurement_model.dart';
import 'package:lincus_maternity/models/measurement/response/get_latest_measurement_response.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

import '../locator.dart';
part 'measurement_tab_store.g.dart';

class MeasurementTabStore = MeasurementTabStoreBase with _$MeasurementTabStore;

abstract class MeasurementTabStoreBase with Store {
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
  ObservableFuture<GetLatestMeasurementResponse> getLatestMeasurementFuture;

  @observable
  ObservableList<MeasurementModel> latestMeasurementList =
      ObservableList<MeasurementModel>();

  @observable
  String weekNumber = AppLocator.home_tab_store.weekNumber;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  CurrentUser get currentUser => AppLocator.current_user;

  MeasurementTabStoreBase(this.preferencesService, this.apiService);

  @action
  Future<GetLatestMeasurementResponse> getLatestMeasurements() async {
    try {
      var latestMeasurementResponse = await apiService.getLatestMeasurement();
      if (latestMeasurementResponse != null &&
          latestMeasurementResponse.status == 200) {
        isInitialised = true;
        AppLocator.current_user.latestMeasurements =
            latestMeasurementResponse.data;
        if (latestMeasurementResponse.data != null) {
          latestMeasurementList.clear();
          latestMeasurementResponse.data
              .forEach((element) => latestMeasurementList.add(element));
        }
        return Future<GetLatestMeasurementResponse>.value(
            latestMeasurementResponse);
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
  void initialiseGetLatestMeasurements() {
    getLatestMeasurementFuture = ObservableFuture(getLatestMeasurements());
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void resetShowError() {
    showError = null;
    errorText = "";
  }
}
