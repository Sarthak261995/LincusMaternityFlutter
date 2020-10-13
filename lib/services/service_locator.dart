import 'package:get_it/get_it.dart';
import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/settings_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'https_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator(SharedPreferences sharedPreferences) {
  // services
  serviceLocator.registerLazySingleton<ApiService>(() => ApiService());
  serviceLocator.registerLazySingleton<PreferencesService>(
      () => PreferencesService(sharedPreferences));
  serviceLocator.registerLazySingleton<SettingsStore>(
      () => SettingsStore(serviceLocator<PreferencesService>()));
  serviceLocator.registerLazySingleton<CurrentUser>(
      () => CurrentUser(serviceLocator<PreferencesService>()));
  // You can replace the actual services above with fake implementations during development.
  //
  // serviceLocator.registerLazySingleton<WebApi>(() => FakeWebApi());
  // serviceLocator.registerLazySingleton<StorageService>(() => FakeStorageService());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceFake());

  // view models
  serviceLocator.registerFactory<LoginStore>(() => LoginStore(
      preferencesService: serviceLocator<PreferencesService>(),
      apiService: serviceLocator<ApiService>()));
  //serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}
