// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SurveyTabStore on SurveyTabStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'SurveyTabStoreBase.showError');

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

  final _$isBusyAtom = Atom(name: 'SurveyTabStoreBase.isBusy');

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

  final _$isInitialisedAtom = Atom(name: 'SurveyTabStoreBase.isInitialised');

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

  final _$getAvailableSurveyFutureAtom =
      Atom(name: 'SurveyTabStoreBase.getAvailableSurveyFuture');

  @override
  ObservableFuture<GetAvailableSurveyResponse> get getAvailableSurveyFuture {
    _$getAvailableSurveyFutureAtom.reportRead();
    return super.getAvailableSurveyFuture;
  }

  @override
  set getAvailableSurveyFuture(
      ObservableFuture<GetAvailableSurveyResponse> value) {
    _$getAvailableSurveyFutureAtom
        .reportWrite(value, super.getAvailableSurveyFuture, () {
      super.getAvailableSurveyFuture = value;
    });
  }

  final _$availableSurveyListAtom =
      Atom(name: 'SurveyTabStoreBase.availableSurveyList');

  @override
  ObservableList<SurveyModel> get availableSurveyList {
    _$availableSurveyListAtom.reportRead();
    return super.availableSurveyList;
  }

  @override
  set availableSurveyList(ObservableList<SurveyModel> value) {
    _$availableSurveyListAtom.reportWrite(value, super.availableSurveyList, () {
      super.availableSurveyList = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'SurveyTabStoreBase.weekNumber');

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

  final _$userNameAtom = Atom(name: 'SurveyTabStoreBase.userName');

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

  final _$getAvailableSurveyAsyncAction =
      AsyncAction('SurveyTabStoreBase.getAvailableSurvey');

  @override
  Future<GetAvailableSurveyResponse> getAvailableSurvey() {
    return _$getAvailableSurveyAsyncAction
        .run(() => super.getAvailableSurvey());
  }

  final _$SurveyTabStoreBaseActionController =
      ActionController(name: 'SurveyTabStoreBase');

  @override
  void initialiseGetAvailableSurvey() {
    final _$actionInfo = _$SurveyTabStoreBaseActionController.startAction(
        name: 'SurveyTabStoreBase.initialiseGetAvailableSurvey');
    try {
      return super.initialiseGetAvailableSurvey();
    } finally {
      _$SurveyTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$SurveyTabStoreBaseActionController.startAction(
        name: 'SurveyTabStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$SurveyTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
isBusy: ${isBusy},
isInitialised: ${isInitialised},
getAvailableSurveyFuture: ${getAvailableSurveyFuture},
availableSurveyList: ${availableSurveyList},
weekNumber: ${weekNumber},
userName: ${userName}
    ''';
  }
}
