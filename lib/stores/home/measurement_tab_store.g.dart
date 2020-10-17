// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeasurementTabStore on MeasurementTabStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'MeasurementTabStoreBase.showError');

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

  final _$isBusyAtom = Atom(name: 'MeasurementTabStoreBase.isBusy');

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

  final _$isInitialisedAtom =
      Atom(name: 'MeasurementTabStoreBase.isInitialised');

  @override
  bool get isInitialised {
    _$isInitialisedAtom.reportRead();
    return super.isInitialised;
  }

  @override
  set isInitialised(bool value) {
    _$isInitialisedAtom.reportWrite(value, super.isInitialised, () {
      super.isInitialised = value;
    });
  }

  final _$getLatestMeasurementFutureAtom =
      Atom(name: 'MeasurementTabStoreBase.getLatestMeasurementFuture');

  @override
  ObservableFuture<GetLatestMeasurementResponse>
      get getLatestMeasurementFuture {
    _$getLatestMeasurementFutureAtom.reportRead();
    return super.getLatestMeasurementFuture;
  }

  @override
  set getLatestMeasurementFuture(
      ObservableFuture<GetLatestMeasurementResponse> value) {
    _$getLatestMeasurementFutureAtom
        .reportWrite(value, super.getLatestMeasurementFuture, () {
      super.getLatestMeasurementFuture = value;
    });
  }

  final _$latestMeasurementListAtom =
      Atom(name: 'MeasurementTabStoreBase.latestMeasurementList');

  @override
  ObservableList<MeasurementModel> get latestMeasurementList {
    _$latestMeasurementListAtom.reportRead();
    return super.latestMeasurementList;
  }

  @override
  set latestMeasurementList(ObservableList<MeasurementModel> value) {
    _$latestMeasurementListAtom.reportWrite(value, super.latestMeasurementList,
        () {
      super.latestMeasurementList = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'MeasurementTabStoreBase.weekNumber');

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

  final _$userNameAtom = Atom(name: 'MeasurementTabStoreBase.userName');

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

  final _$getLatestMeasurementsAsyncAction =
      AsyncAction('MeasurementTabStoreBase.getLatestMeasurements');

  @override
  Future<GetLatestMeasurementResponse> getLatestMeasurements() {
    return _$getLatestMeasurementsAsyncAction
        .run(() => super.getLatestMeasurements());
  }

  final _$MeasurementTabStoreBaseActionController =
      ActionController(name: 'MeasurementTabStoreBase');

  @override
  void initialiseGetLatestMeasurements() {
    final _$actionInfo = _$MeasurementTabStoreBaseActionController.startAction(
        name: 'MeasurementTabStoreBase.initialiseGetLatestMeasurements');
    try {
      return super.initialiseGetLatestMeasurements();
    } finally {
      _$MeasurementTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$MeasurementTabStoreBaseActionController.startAction(
        name: 'MeasurementTabStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$MeasurementTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
isBusy: ${isBusy},
isInitialised: ${isInitialised},
getLatestMeasurementFuture: ${getLatestMeasurementFuture},
latestMeasurementList: ${latestMeasurementList},
weekNumber: ${weekNumber},
userName: ${userName}
    ''';
  }
}
