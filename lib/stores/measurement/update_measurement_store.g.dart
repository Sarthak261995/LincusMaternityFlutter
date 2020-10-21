// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_measurement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateMeasurementStore on UpdateMeasurementStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'UpdateMeasurementStoreBase.showError');

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

  final _$showAlertAtom = Atom(name: 'UpdateMeasurementStoreBase.showAlert');

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

  final _$isBusyAtom = Atom(name: 'UpdateMeasurementStoreBase.isBusy');

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

  final _$noteAtom = Atom(name: 'UpdateMeasurementStoreBase.note');

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

  final _$dateAtom = Atom(name: 'UpdateMeasurementStoreBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$timeAtom = Atom(name: 'UpdateMeasurementStoreBase.time');

  @override
  TimeOfDay get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'UpdateMeasurementStoreBase.weekNumber');

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

  final _$userNameAtom = Atom(name: 'UpdateMeasurementStoreBase.userName');

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

  final _$tryUpdateValueAsyncAction =
      AsyncAction('UpdateMeasurementStoreBase.tryUpdateValue');

  @override
  Future<bool> tryUpdateValue() {
    return _$tryUpdateValueAsyncAction.run(() => super.tryUpdateValue());
  }

  final _$tryUpdateCommentAsyncAction =
      AsyncAction('UpdateMeasurementStoreBase.tryUpdateComment');

  @override
  Future<bool> tryUpdateComment() {
    return _$tryUpdateCommentAsyncAction.run(() => super.tryUpdateComment());
  }

  final _$UpdateMeasurementStoreBaseActionController =
      ActionController(name: 'UpdateMeasurementStoreBase');

  @override
  void clear_data() {
    final _$actionInfo = _$UpdateMeasurementStoreBaseActionController
        .startAction(name: 'UpdateMeasurementStoreBase.clear_data');
    try {
      return super.clear_data();
    } finally {
      _$UpdateMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$UpdateMeasurementStoreBaseActionController
        .startAction(name: 'UpdateMeasurementStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$UpdateMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAlertData() {
    final _$actionInfo = _$UpdateMeasurementStoreBaseActionController
        .startAction(name: 'UpdateMeasurementStoreBase.resetAlertData');
    try {
      return super.resetAlertData();
    } finally {
      _$UpdateMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateValueUpdate() {
    final _$actionInfo = _$UpdateMeasurementStoreBaseActionController
        .startAction(name: 'UpdateMeasurementStoreBase.validateValueUpdate');
    try {
      return super.validateValueUpdate();
    } finally {
      _$UpdateMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateCommentUpdate() {
    final _$actionInfo = _$UpdateMeasurementStoreBaseActionController
        .startAction(name: 'UpdateMeasurementStoreBase.validateCommentUpdate');
    try {
      return super.validateCommentUpdate();
    } finally {
      _$UpdateMeasurementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
showAlert: ${showAlert},
isBusy: ${isBusy},
note: ${note},
date: ${date},
time: ${time},
weekNumber: ${weekNumber},
userName: ${userName}
    ''';
  }
}
