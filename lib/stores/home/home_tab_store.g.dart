// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeTabStore on HomeTabStoreBase, Store {
  final _$showErrorAtom = Atom(name: 'HomeTabStoreBase.showError');

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

  final _$isBusyAtom = Atom(name: 'HomeTabStoreBase.isBusy');

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

  final _$getWellbeingScoreFutureAtom =
      Atom(name: 'HomeTabStoreBase.getWellbeingScoreFuture');

  @override
  ObservableFuture<GetWellbeingScoreResponse> get getWellbeingScoreFuture {
    _$getWellbeingScoreFutureAtom.reportRead();
    return super.getWellbeingScoreFuture;
  }

  @override
  set getWellbeingScoreFuture(
      ObservableFuture<GetWellbeingScoreResponse> value) {
    _$getWellbeingScoreFutureAtom
        .reportWrite(value, super.getWellbeingScoreFuture, () {
      super.getWellbeingScoreFuture = value;
    });
  }

  final _$getPregnancyDetailResponseFutureAtom =
      Atom(name: 'HomeTabStoreBase.getPregnancyDetailResponseFuture');

  @override
  ObservableFuture<GetPregnancyDetailResponse>
      get getPregnancyDetailResponseFuture {
    _$getPregnancyDetailResponseFutureAtom.reportRead();
    return super.getPregnancyDetailResponseFuture;
  }

  @override
  set getPregnancyDetailResponseFuture(
      ObservableFuture<GetPregnancyDetailResponse> value) {
    _$getPregnancyDetailResponseFutureAtom
        .reportWrite(value, super.getPregnancyDetailResponseFuture, () {
      super.getPregnancyDetailResponseFuture = value;
    });
  }

  final _$wellbeingScoreAtom = Atom(name: 'HomeTabStoreBase.wellbeingScore');

  @override
  String get wellbeingScore {
    _$wellbeingScoreAtom.reportRead();
    return super.wellbeingScore;
  }

  @override
  set wellbeingScore(String value) {
    _$wellbeingScoreAtom.reportWrite(value, super.wellbeingScore, () {
      super.wellbeingScore = value;
    });
  }

  final _$wellbeingProgressAtom =
      Atom(name: 'HomeTabStoreBase.wellbeingProgress');

  @override
  double get wellbeingProgress {
    _$wellbeingProgressAtom.reportRead();
    return super.wellbeingProgress;
  }

  @override
  set wellbeingProgress(double value) {
    _$wellbeingProgressAtom.reportWrite(value, super.wellbeingProgress, () {
      super.wellbeingProgress = value;
    });
  }

  final _$userNameAtom = Atom(name: 'HomeTabStoreBase.userName');

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

  final _$lastUpdateDateWellbeingScoreAtom =
      Atom(name: 'HomeTabStoreBase.lastUpdateDateWellbeingScore');

  @override
  String get lastUpdateDateWellbeingScore {
    _$lastUpdateDateWellbeingScoreAtom.reportRead();
    return super.lastUpdateDateWellbeingScore;
  }

  @override
  set lastUpdateDateWellbeingScore(String value) {
    _$lastUpdateDateWellbeingScoreAtom
        .reportWrite(value, super.lastUpdateDateWellbeingScore, () {
      super.lastUpdateDateWellbeingScore = value;
    });
  }

  final _$weekNumberAtom = Atom(name: 'HomeTabStoreBase.weekNumber');

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

  final _$sizeTextAtom = Atom(name: 'HomeTabStoreBase.sizeText');

  @override
  String get sizeText {
    _$sizeTextAtom.reportRead();
    return super.sizeText;
  }

  @override
  set sizeText(String value) {
    _$sizeTextAtom.reportWrite(value, super.sizeText, () {
      super.sizeText = value;
    });
  }

  final _$dueDateAtom = Atom(name: 'HomeTabStoreBase.dueDate');

  @override
  String get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(String value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  final _$trimesterAtom = Atom(name: 'HomeTabStoreBase.trimester');

  @override
  String get trimester {
    _$trimesterAtom.reportRead();
    return super.trimester;
  }

  @override
  set trimester(String value) {
    _$trimesterAtom.reportWrite(value, super.trimester, () {
      super.trimester = value;
    });
  }

  final _$genderAtom = Atom(name: 'HomeTabStoreBase.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$getWellbeingScoreAsyncAction =
      AsyncAction('HomeTabStoreBase.getWellbeingScore');

  @override
  Future<GetWellbeingScoreResponse> getWellbeingScore() {
    return _$getWellbeingScoreAsyncAction.run(() => super.getWellbeingScore());
  }

  final _$getPregnancyDetailsAsyncAction =
      AsyncAction('HomeTabStoreBase.getPregnancyDetails');

  @override
  Future<GetPregnancyDetailResponse> getPregnancyDetails() {
    return _$getPregnancyDetailsAsyncAction
        .run(() => super.getPregnancyDetails());
  }

  final _$HomeTabStoreBaseActionController =
      ActionController(name: 'HomeTabStoreBase');

  @override
  Future<dynamic> initialiseWellbeingScore() {
    final _$actionInfo = _$HomeTabStoreBaseActionController.startAction(
        name: 'HomeTabStoreBase.initialiseWellbeingScore');
    try {
      return super.initialiseWellbeingScore();
    } finally {
      _$HomeTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> initialisePregnancyDetails() {
    final _$actionInfo = _$HomeTabStoreBaseActionController.startAction(
        name: 'HomeTabStoreBase.initialisePregnancyDetails');
    try {
      return super.initialisePregnancyDetails();
    } finally {
      _$HomeTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetShowError() {
    final _$actionInfo = _$HomeTabStoreBaseActionController.startAction(
        name: 'HomeTabStoreBase.resetShowError');
    try {
      return super.resetShowError();
    } finally {
      _$HomeTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showError: ${showError},
isBusy: ${isBusy},
getWellbeingScoreFuture: ${getWellbeingScoreFuture},
getPregnancyDetailResponseFuture: ${getPregnancyDetailResponseFuture},
wellbeingScore: ${wellbeingScore},
wellbeingProgress: ${wellbeingProgress},
userName: ${userName},
lastUpdateDateWellbeingScore: ${lastUpdateDateWellbeingScore},
weekNumber: ${weekNumber},
sizeText: ${sizeText},
dueDate: ${dueDate},
trimester: ${trimester},
gender: ${gender}
    ''';
  }
}
