import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'login_store.g.dart';
class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  PreferencesService preferencesService;
  ApiService apiService;
  final FormErrorState error = FormErrorState();
  @observable
  String username;

  @observable
  String password;

  String errorText = "";

  @observable
  bool showError;

  @observable
  bool isBusy = false;

  @computed
  bool get canLogin => !error.hasErrors;

  /// when the store is created, we read in the current settings immediately to avoid the scenario where
  /// the values displayed will change upon switching to the settings tab
  LoginStoreBase({this.preferencesService,this.apiService}) {
  }

  @action
  Future<void> try_login() async{
    try
    {
      var loginResponse = await apiService.getAccessToken(username: username,password: password);
    }
    catch(e)
    {
      errorText = e.toString();
      showError = true;
    }
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => username, validateUsername),
      //reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  void validateUsername(String value) {
    error.username = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    //validateEmail(email);
    validateUsername(username);
  }

  @action
  void clear_data(){
    username = "";
    password = "";
    error.username = null;
    error.password = null;
    error.email = null;
  }

  @action
  void resetShowError()
  {
    showError = null;
    errorText = "";
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String username;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => username != null || password != null;
}