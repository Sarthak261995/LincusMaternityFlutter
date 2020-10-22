// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_measurement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddMeasurementStore on AddMeasurementStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'AddMeasurementStoreBase.showError');

  @override
  bool get showError {
    _$showErrorAtom.reportRead();
    return super.showError;
  }

  @override
  set showError(bool value) {
    _$showErrorAtom.reportWrite(value, super.showError, () {
      super.showError = value;
    });
  }

  final _$showAlertAtom = Atom(name: 'AddMeasurementStoreBase.showAlert');

  @override
  bool get showAlert {
    _$showAlertAtom.reportRead();
    return super.showAlert;
  }

  @override
  set showAlert(bool value) {
    _$showAlertAtom.reportWrite(value, super.showAlert, () {
      super.showAlert = value;
    });
  }

  final _$isBusyAtom = Atom(name: 'AddMeasurementStoreBase.isBusy');

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  final _$noteAtom = Atom(name: 'AddMeasurementStoreBase.note');

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  final _$getMeasurementOptionFutureAtom =
      Atom(name: 'AddMeasurementStoreBase.getMeasurementOptionFuture');

  @override
  ObservableFuture<GetMeasurementOptionResponse>
      get getMeasurementOptionFuture {
    _$getMeasurementOptionFutureAtom.reportRead();
    return super.getMeasurementOptionFuture;
  }

  @override
  set getMeasurementOptionFuture(
      ObservableFuture<GetMeasurementOptionResponse> value) {
    _$getMeasurementOptionFutureAtom
        .reportWrite(value, super.getMeasurementOptionFuture, () {
      super.getMeasurementOptionFuture = value;
    });
  }

  final _$measurementOptionListAtom =
      Atom(name: 'AddMeasurementStoreBase.measurementOptionList');

  @override
  ObservableList<MeasurementOptionModel> get measurementOptionList {
    _$measurementOptionListAtom.reportRead();
    return super.measurementOptionList;
  }

  @override
  set measurementOptionList(ObservableList<MeasurementOptionModel> value) {
    _$measurementOptionListAtom.reportWrite(value, super.measurementOptionList,
        () {
      super.measurementOptionList = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'AddMeasurementStoreBase.weekNumber');

  @override
  String get weekNumber {
    _$weekNumberAtom.reportRead();
    return super.weekNumber;
  }

  @override
  set weekNumber(String value) {
    _$weekNumberAtom.reportWrite(value, super.weekNumber, () {
      super.weekNumber = value;
    });
  }

  final _$userNameAtom = Atom(name: 'AddMeasurementStoreBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$getMeasurementOptionAsyncAction =
      AsyncAction('AddMeasurementStoreBase.getMeasurementOption');

  @override
  Future<GetMeasurementOptionResponse> getMeasurementOption() {
    return _$getMeasurementOptionAsyncAction
        .run(() => super.getMeasurementOption());
  }

  final _$tryUpdateValueAsyncAction =
      AsyncAction('AddMeasurementStoreBase.tryUpdateValue');

  @override
  Future<bool> tryUpdateValue() {
    return _$tryUpdateValueAsyncAction.run(() => super.tryUpdateValue());
  }

  final _$AddMeasurementStoreBaseActionController =
      ActionController(name: 'AddMeasurementStoreBase');

  @override
  void clear_data() {
    final _$actionInfo = _$AddMeasurementStoreBaseActionController.startAction(
        name: 'AddMeasurementStoreBase.clear_data');
    try {
      return super.clear_data();
    } finally {
      _$AddMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$AddMeasurementStoreBaseActionController.startAction(
        name: 'AddMeasurementStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$AddMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAlertData() {
    final _$actionInfo = _$AddMeasurementStoreBaseActionController.startAction(
        name: 'AddMeasurementStoreBase.resetAlertData');
    try {
      return super.resetAlertData();
    } finally {
      _$AddMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialiseGetMeasurementOption() {
    final _$actionInfo = _$AddMeasurementStoreBaseActionController.startAction(
        name: 'AddMeasurementStoreBase.initialiseGetMeasurementOption');
    try {
      return super.initialiseGetMeasurementOption();
    } finally {
      _$AddMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateValueUpdate() {
    final _$actionInfo = _$AddMeasurementStoreBaseActionController.startAction(
        name: 'AddMeasurementStoreBase.validateValueUpdate');
    try {
      return super.validateValueUpdate();
    } finally {
      _$AddMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
showAlert: ${showAlert},
isBusy: ${isBusy},
note: ${note},
getMeasurementOptionFuture: ${getMeasurementOptionFuture},
measurementOptionList: ${measurementOptionList},
weekNumber: ${weekNumber},
userName: ${userName}
    ''';
  }
}
