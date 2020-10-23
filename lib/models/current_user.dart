import 'package:lincus_maternity/models/User/basic_info.dart';
import 'package:lincus_maternity/models/authentication/access_token.dart';
import 'package:lincus_maternity/models/measurement/measurement_model.dart';
import 'package:lincus_maternity/models/pregnancy/pregnancy_details.dart';
import 'package:lincus_maternity/models/survey/survey_detail.dart';
import 'package:lincus_maternity/models/survey/survey_model.dart';
import 'package:lincus_maternity/models/wellbeing/wellbeing_score.dart';
import 'package:lincus_maternity/services/preferences_service.dart';

import 'measurement/measurement_option_model.dart';

class CurrentUser {
  String username;
  String password;
  PreferencesService preferencesService;
  AccessToken accessToken;
  UserBasicInfo userBasicInfo;
  WellBeingScore wellBeingScore;
  PregnancyDetails pregnancyDetails;
  List<MeasurementModel> latestMeasurements;
  List<MeasurementOptionModel> measurementOptions;
  SurveyDetail surveyDetail;
  List<SurveyModel> availableSurvey;
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
