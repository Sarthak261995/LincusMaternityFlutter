import 'package:lincus_maternity/models/current_user.dart';
import 'package:lincus_maternity/services/https_service.dart';
import 'package:lincus_maternity/services/preferences_service.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/birthplan/create_birthplan_store.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';
import 'package:lincus_maternity/stores/home/survey_tab_store.dart';
import 'package:lincus_maternity/stores/measurement/update_measurement_store.dart';
import 'package:lincus_maternity/stores/survey/take_survey_store.dart';

import 'home/measurement_tab_store.dart';
import 'measurement/add_measurement_store.dart';

class AppLocator {
  static LoginStore get login_store =>
      serviceLocator<LoginStore>() ??
      LoginStore(
          preferencesService: serviceLocator<PreferencesService>(),
          apiService: serviceLocator<ApiService>());
  static HomeTabStore get home_tab_store => serviceLocator<HomeTabStore>();
  static MeasurementTabStore get measurement_tab_store =>
      serviceLocator<MeasurementTabStore>();
  static UpdateMeasurementStore get update_measurement_store =>
      serviceLocator<UpdateMeasurementStore>();
  static AddMeasurementStore get add_measurement_store =>
      serviceLocator<AddMeasurementStore>();
  static SurveyTabStore get survey_tab_store =>
      serviceLocator<SurveyTabStore>();
  static TakeSurveyStore get take_survey_store =>
      serviceLocator<TakeSurveyStore>();
  static CreateBirthplanStore get create_birthplan_store =>
      serviceLocator<CreateBirthplanStore>();
  static PreferencesService get preferences_service =>
      serviceLocator<PreferencesService>();
  static CurrentUser get current_user => serviceLocator<CurrentUser>();
}
