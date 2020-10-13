import 'package:lincus_maternity/models/User/basic_info.dart';
import 'package:lincus_maternity/models/authentication/access_token.dart';
import 'package:lincus_maternity/services/preferences_service.dart';

class CurrentUser {
  String username;
  String password;
  PreferencesService preferencesService;
  AccessToken accessToken;
  UserBasicInfo userBasicInfo;
  CurrentUser(this.preferencesService);

  Future<void> LoadUserData() async {
    username = preferencesService.userName;
    password = preferencesService.password;
    accessToken = await preferencesService.getAccessToken();
    userBasicInfo = await preferencesService.getUserBasicDetails();
  }

  Future<void> LoadUserOnlyData() async {
    username = preferencesService.userName;
    password = preferencesService.password;
    //accessToken = await preferencesService.getAccessToken();
    userBasicInfo = await preferencesService.getUserBasicDetails();
  }
}
