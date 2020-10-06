import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';
class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  PreferencesService preferencesService;
  ApiService apiService;

  @observable
  String username;

  @observable
  String password;

  String errorText = "";

  @observable
  bool showError;

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

  @action
  void clear_data(){
    username = "";
    password = "";
  }

  @action
  void resetShowError()
  {
    showError = null;
    errorText = "";
  }
}