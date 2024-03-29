class AppUrls {
  static const base_url =
      'https://dev-lincus.onemedicaltechnologies.co.uk/api/';
  static const get_access_token_url = base_url + "authentication/access-token";
  static const get_basic_info_url = base_url + "profile/basic-information";
  static const get_wellbeing_score_url = base_url + "wellbeing/score";
  static const get_pregnancy_details_url = base_url + "maternity/pregnancy";
  static const get_measurement_latest_url = base_url + "measurements/latest";
  static const update_measurement_url = base_url + "measurements";
  static const get_measurement_option_url = base_url + "measurements/options";
  static const get_available_survey_url = base_url + "wellbeing/available";
  static const get_survey_detail = base_url + "wellbeing/survey";
  static const save_survey_url = base_url + "wellbeing";
  static const get_birthplan_question =
      base_url + "maternity/birthplan/questions";
  static const submit_birthplan_question = base_url + "maternity/birthplan";
}
