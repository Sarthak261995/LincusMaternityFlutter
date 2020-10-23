import 'package:get_it/get_it.dart';
import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';
import 'package:lincus_maternity/stores/home/measurement_tab_store.dart';
import 'package:lincus_maternity/stores/home/survey_tab_store.dart';
import 'package:lincus_maternity/stores/measurement/add_measurement_store.dart';
import 'package:lincus_maternity/stores/measurement/update_measurement_store.dart';
import 'package:lincus_maternity/stores/settings_store.dart';
import 'package:lincus_maternity/stores/survey/take_survey_store.dart';
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
  serviceLocator.registerLazySingleton<LoginStore>(() => LoginStore(
      preferencesService: serviceLocator<PreferencesService>(),
      apiService: serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<HomeTabStore>(() => HomeTabStore(
      serviceLocator<PreferencesService>(), serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<MeasurementTabStore>(() =>
      MeasurementTabStore(
          serviceLocator<PreferencesService>(), serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<SurveyTabStore>(() => SurveyTabStore(
      serviceLocator<PreferencesService>(), serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<UpdateMeasurementStore>(() =>
      UpdateMeasurementStore(
          serviceLocator<PreferencesService>(), serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<AddMeasurementStore>(() =>
      AddMeasurementStore(
          serviceLocator<PreferencesService>(), serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<TakeSurveyStore>(() => TakeSurveyStore(
      serviceLocator<PreferencesService>(), serviceLocator<ApiService>()));
  //serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}
