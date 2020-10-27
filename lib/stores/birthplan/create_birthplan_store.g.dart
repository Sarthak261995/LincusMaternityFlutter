// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_birthplan_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateBirthplanStore on CreateBirthplanStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'CreateBirthplanStoreBase.showError');

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

  final _$showAlertAtom = Atom(name: 'CreateBirthplanStoreBase.showAlert');

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

  final _$isBusyAtom = Atom(name: 'CreateBirthplanStoreBase.isBusy');

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

  final _$getBirthplanQuestionFutureAtom =
      Atom(name: 'CreateBirthplanStoreBase.getBirthplanQuestionFuture');

  @override
  ObservableFuture<GetBirthplanQuestionResponse>
      get getBirthplanQuestionFuture {
    _$getBirthplanQuestionFutureAtom.reportRead();
    return super.getBirthplanQuestionFuture;
  }

  @override
  set getBirthplanQuestionFuture(
      ObservableFuture<GetBirthplanQuestionResponse> value) {
    _$getBirthplanQuestionFutureAtom
        .reportWrite(value, super.getBirthplanQuestionFuture, () {
      super.getBirthplanQuestionFuture = value;
    });
  }

  final _$birthplanDetailsListAtom =
      Atom(name: 'CreateBirthplanStoreBase.birthplanDetailsList');

  @override
  ObservableList<BirthplanQuestionDetails> get birthplanDetailsList {
    _$birthplanDetailsListAtom.reportRead();
    return super.birthplanDetailsList;
  }

  @override
  set birthplanDetailsList(ObservableList<BirthplanQuestionDetails> value) {
    _$birthplanDetailsListAtom.reportWrite(value, super.birthplanDetailsList,
        () {
      super.birthplanDetailsList = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'CreateBirthplanStoreBase.weekNumber');

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

  final _$userNameAtom = Atom(name: 'CreateBirthplanStoreBase.userName');

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

  final _$getBirthplanQuestionAsyncAction =
      AsyncAction('CreateBirthplanStoreBase.getBirthplanQuestion');

  @override
  Future<GetBirthplanQuestionResponse> getBirthplanQuestion() {
    return _$getBirthplanQuestionAsyncAction
        .run(() => super.getBirthplanQuestion());
  }

  final _$tryUpdateValueAsyncAction =
      AsyncAction('CreateBirthplanStoreBase.tryUpdateValue');

  @override
  Future<bool> tryUpdateValue() {
    return _$tryUpdateValueAsyncAction.run(() => super.tryUpdateValue());
  }

  final _$CreateBirthplanStoreBaseActionController =
      ActionController(name: 'CreateBirthplanStoreBase');

  @override
  void clear_data() {
    final _$actionInfo = _$CreateBirthplanStoreBaseActionController.startAction(
        name: 'CreateBirthplanStoreBase.clear_data');
    try {
      return super.clear_data();
    } finally {
      _$CreateBirthplanStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$CreateBirthplanStoreBaseActionController.startAction(
        name: 'CreateBirthplanStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$CreateBirthplanStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAlertData() {
    final _$actionInfo = _$CreateBirthplanStoreBaseActionController.startAction(
        name: 'CreateBirthplanStoreBase.resetAlertData');
    try {
      return super.resetAlertData();
    } finally {
      _$CreateBirthplanStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialiseGetBirthplanQuestion() {
    final _$actionInfo = _$CreateBirthplanStoreBaseActionController.startAction(
        name: 'CreateBirthplanStoreBase.initialiseGetBirthplanQuestion');
    try {
      return super.initialiseGetBirthplanQuestion();
    } finally {
      _$CreateBirthplanStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateValueUpdate() {
    final _$actionInfo = _$CreateBirthplanStoreBaseActionController.startAction(
        name: 'CreateBirthplanStoreBase.validateValueUpdate');
    try {
      return super.validateValueUpdate();
    } finally {
      _$CreateBirthplanStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
showAlert: ${showAlert},
isBusy: ${isBusy},
getBirthplanQuestionFuture: ${getBirthplanQuestionFuture},
birthplanDetailsList: ${birthplanDetailsList},
weekNumber: ${weekNumber},
userName: ${userName}
    ''';
  }
}
