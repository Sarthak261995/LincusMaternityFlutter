import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/helper.dart';
import 'package:lincus_maternity/models/measurement/measurement_option_model.dart';
import 'package:lincus_maternity/models/measurement/request/update_measurement_request.dart';
import 'package:lincus_maternity/models/measurement/response/get_measurement_option_response.dart';
import 'package:lincus_maternity/models/measurement/update_measurement_model.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:mobx/mobx.dart';
import 'dart:core';
part 'add_measurement_store.g.dart';

class AddMeasurementStore = AddMeasurementStoreBase with _$AddMeasurementStore;

abstract class AddMeasurementStoreBase with Store {
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
  String note = "";

  @observable
  ObservableFuture<GetMeasurementOptionResponse> getMeasurementOptionFuture;

  @observable
  ObservableList<MeasurementOptionModel> measurementOptionList =
      ObservableList<MeasurementOptionModel>();

  @observable
  String weekNumber = AppLocator.home_tab_store.weekNumber;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  CurrentUser get currentUser => AppLocator.current_user;
  AddMeasurementStoreBase(this.preferencesService, this.apiService);

  @action
  Future<GetMeasurementOptionResponse> getMeasurementOption() async {
    try {
      var measurementOptionResponse = await apiService.getMeasurementOption();
      if (measurementOptionResponse != null &&
          measurementOptionResponse.status == 200) {
        AppLocator.current_user.measurementOptions =
            measurementOptionResponse.data;
        if (measurementOptionResponse.data != null) {
          measurementOptionList.clear();
          measurementOptionResponse.data
              .forEach((element) => measurementOptionList.add(element));
        }
        return Future<GetMeasurementOptionResponse>.value(
            measurementOptionResponse);
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
  void initialiseGetMeasurementOption() {
    getMeasurementOptionFuture = ObservableFuture(getMeasurementOption());
  }

  UpdateMeasurementRequest getUpdateValueMeasurementRequest() {
    var request = new UpdateMeasurementRequest();
    request.latitude = 0.0;
    request.longitude = 0.0;
    request.comment = note;
    request.photofilename = '';
    request.datetime =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    request.appTimestamp =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    //request.datetime =
    //'${DateTime(date.year, date.month, date.day, time.hour, time.minute, 0, 0, 0).toLocal().toIso8601String()}+00:00';
    //request.appTimestamp =
    //'${DateTime.now().toLocal().toIso8601String()}+00:00';
    //request.datetime = '2020-10-20T22:20:33+01:00';
    //request.appTimestamp = '2020-10-20T23:16:18+00:00';
    var measurementList = new List<UpdateMeasurementModel>();
    measurementOptionList.forEach((element) {
      if (element.value != null && element.value.isNotEmpty) {
        measurementList.add(UpdateMeasurementModel(
            type: element.id, value: double.parse(element.value)));
      }
    });
    request.measurements = measurementList;
    return request;
  }

  @action
  bool validateValueUpdate() {
    bool result = true;
    String errorText;
    int valueCount = 0;
    measurementOptionList.forEach((element) {
      if (element.value != null && element.value.isNotEmpty) {
        valueCount++;
      }
    });
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
