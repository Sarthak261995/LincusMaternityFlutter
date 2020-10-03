import 'package:get_it/get_it.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/settings_store.dart';

import 'https_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<ApiService>(() => ApiService());
  serviceLocator.registerLazySingleton<PreferencesService>(() => PreferencesService());
  serviceLocator.registerLazySingleton<SettingsStore>(() => SettingsStore(serviceLocator<PreferencesService>()));

  // You can replace the actual services above with fake implementations during development.
  //
  // serviceLocator.registerLazySingleton<WebApi>(() => FakeWebApi());
  // serviceLocator.registerLazySingleton<StorageService>(() => FakeStorageService());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceFake());

  // view models
  serviceLocator.registerFactory<LoginStore>(() => LoginStore(preferencesService:serviceLocator<PreferencesService>(), apiService:serviceLocator<ApiService>() ));
  //serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}