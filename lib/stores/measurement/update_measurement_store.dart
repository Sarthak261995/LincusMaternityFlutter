import 'package:flutter/material.dart';
import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/helper.dart';
import 'package:lincus_maternity/models/measurement/measurement_model.dart';
import 'package:lincus_maternity/models/measurement/request/update_measurement_comment_request.dart';
import 'package:lincus_maternity/models/measurement/request/update_measurement_request.dart';
import 'package:lincus_maternity/models/measurement/update_measurement_model.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'dart:core';
part 'update_measurement_store.g.dart';

class UpdateMeasurementStore = UpdateMeasurementStoreBase
    with _$UpdateMeasurementStore;

abstract class UpdateMeasurementStoreBase with Store {
  PreferencesService preferencesService;
  ApiService apiService;

  String errorText = "";

  MeasurementModel measurementModel;

  @observable
  bool showError;

  @observable
  bool showAlert;

  String alertTitle = '';

  String alertMessage = '';

  @observable
  bool isBusy = false;

  String value = "";

  @observable
  String note = "";

  @observable
  DateTime date = DateTime.now();

  @observable
  TimeOfDay time = TimeOfDay.now();

  @observable
  String weekNumber = AppLocator.home_tab_store.weekNumber;

  @observable
  String userName =
      '${AppLocator.current_user.userBasicInfo.forename} ${AppLocator.current_user.userBasicInfo.surname}';

  CurrentUser get currentUser => AppLocator.current_user;
  UpdateMeasurementStoreBase(this.preferencesService, this.apiService);

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

  @action
  Future<bool> tryUpdateComment() async {
    bool result = false;
    try {
      var request = getUpdateCommentMeasurementRequest();
      var updateResponse = await apiService.updateMeasurementComment(
          measurementModel.index.toString(), request);
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
    date = DateTime.now();
    time = TimeOfDay.now();
    value = '';
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

  UpdateMeasurementRequest getUpdateValueMeasurementRequest() {
    var request = new UpdateMeasurementRequest();
    request.latitude = 0.0;
    request.longitude = 0.0;
    request.comment = note;
    request.photofilename = '';
    //request.datetime = DateFormat('yyyy-MM-ddTHH:mm:sszzz').format(DateTime(
    //date.year, date.month, date.day, time.hour, time.minute, 0, 0, 0));
    //request.datetime =
    //'${DateTime(date.year, date.month, date.day, time.hour, time.minute, 0, 0, 0).toLocal().toIso8601String()}+00:00';
    //request.appTimestamp =
    //'${DateTime.now().toLocal().toIso8601String()}+00:00';
    request.datetime =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    request.appTimestamp =
        '${Helper.toIso8601String(DateTime.now().toLocal())}+00:00';
    //request.datetime = '2020-10-20T22:20:33+01:00';
    //request.appTimestamp = '2020-10-20T23:16:18+00:00';
    var measurementList = new List<UpdateMeasurementModel>();
    measurementList.add(UpdateMeasurementModel(
        type: measurementModel.bmId, value: double.tryParse(value)));
    request.measurements = measurementList;
    return request;
  }

  UpdateMeasurementCommentRequest getUpdateCommentMeasurementRequest() {
    var request = new UpdateMeasurementCommentRequest();
    request.comments = note;
    return request;
  }

  @action
  bool validateValueUpdate() {
    bool result = true;
    String errorText;
    if (value == null || value.isEmpty) {
      result = false;
      errorText = 'value cannot be empty';
    } else {
      var doubleValue = double.tryParse(value);
      if (doubleValue == null) {
        result = false;
        errorText = 'Enter valid value';
      }
    }
    if (errorText != null) {
      alertMessage = errorText;
      alertTitle = 'Error';
      showAlert = true;
    }
    return result;
  }

  @action
  bool validateCommentUpdate() {
    bool result = true;
    String errorText;
    if (note == null || note.isEmpty) {
      result = false;
      errorText = 'note cannot be empty';
    }
    if (errorText != null) {
      alertMessage = errorText;
      alertTitle = 'Error';
      showAlert = true;
    }
    return result;
  }
}
