import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';

class AppLocator {
  static LoginStore get login_store =>
      serviceLocator<LoginStore>() ??
      LoginStore(
          preferencesService: serviceLocator<PreferencesService>(),
          apiService: serviceLocator<ApiService>());
  static HomeTabStore get home_tab_store => serviceLocator<HomeTabStore>();
  static PreferencesService get preferences_service =>
      serviceLocator<PreferencesService>();
  static CurrentUser get current_user => serviceLocator<CurrentUser>();
}
