// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_survey_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TakeSurveyStore on TakeSurveyStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'TakeSurveyStoreBase.showError');

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

  final _$showAlertAtom = Atom(name: 'TakeSurveyStoreBase.showAlert');

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

  final _$isBusyAtom = Atom(name: 'TakeSurveyStoreBase.isBusy');

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

  final _$getSurveyDetailFutureAtom =
      Atom(name: 'TakeSurveyStoreBase.getSurveyDetailFuture');

  @override
  ObservableFuture<GetSurveyDetailResponse> get getSurveyDetailFuture {
    _$getSurveyDetailFutureAtom.reportRead();
    return super.getSurveyDetailFuture;
  }

  @override
  set getSurveyDetailFuture(ObservableFuture<GetSurveyDetailResponse> value) {
    _$getSurveyDetailFutureAtom.reportWrite(value, super.getSurveyDetailFuture,
        () {
      super.getSurveyDetailFuture = value;
    });
  }

  final _$surveyQuestionListAtom =
      Atom(name: 'TakeSurveyStoreBase.surveyQuestionList');

  @override
  ObservableList<SurveyQuestions> get surveyQuestionList {
    _$surveyQuestionListAtom.reportRead();
    return super.surveyQuestionList;
  }

  @override
  set surveyQuestionList(ObservableList<SurveyQuestions> value) {
    _$surveyQuestionListAtom.reportWrite(value, super.surveyQuestionList, () {
      super.surveyQuestionList = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'TakeSurveyStoreBase.weekNumber');

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

  final _$userNameAtom = Atom(name: 'TakeSurveyStoreBase.userName');

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

  final _$getSurveyDetailAsyncAction =
      AsyncAction('TakeSurveyStoreBase.getSurveyDetail');

  @override
  Future<GetSurveyDetailResponse> getSurveyDetail() {
    return _$getSurveyDetailAsyncAction.run(() => super.getSurveyDetail());
  }

  final _$trySaveSurveyAsyncAction =
      AsyncAction('TakeSurveyStoreBase.trySaveSurvey');

  @override
  Future<bool> trySaveSurvey() {
    return _$trySaveSurveyAsyncAction.run(() => super.trySaveSurvey());
  }

  final _$TakeSurveyStoreBaseActionController =
      ActionController(name: 'TakeSurveyStoreBase');

  @override
  void clear_data() {
    final _$actionInfo = _$TakeSurveyStoreBaseActionController.startAction(
        name: 'TakeSurveyStoreBase.clear_data');
    try {
      return super.clear_data();
    } finally {
      _$TakeSurveyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$TakeSurveyStoreBaseActionController.startAction(
        name: 'TakeSurveyStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$TakeSurveyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAlertData() {
    final _$actionInfo = _$TakeSurveyStoreBaseActionController.startAction(
        name: 'TakeSurveyStoreBase.resetAlertData');
    try {
      return super.resetAlertData();
    } finally {
      _$TakeSurveyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialiseGetSurveyDetails() {
    final _$actionInfo = _$TakeSurveyStoreBaseActionController.startAction(
        name: 'TakeSurveyStoreBase.initialiseGetSurveyDetails');
    try {
      return super.initialiseGetSurveyDetails();
    } finally {
      _$TakeSurveyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateSaveSurvey() {
    final _$actionInfo = _$TakeSurveyStoreBaseActionController.startAction(
        name: 'TakeSurveyStoreBase.validateSaveSurvey');
    try {
      return super.validateSaveSurvey();
    } finally {
      _$TakeSurveyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
showAlert: ${showAlert},
isBusy: ${isBusy},
getSurveyDetailFuture: ${getSurveyDetailFuture},
surveyQuestionList: ${surveyQuestionList},
weekNumber: ${weekNumber},
userName: ${userName}
    ''';
  }
}
