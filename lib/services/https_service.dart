import 'package:http/http.dart';
import 'package:lincus_maternity/models/User/Response/basic_info_response.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/authentication/access_token.dart';
import 'package:lincus_maternity/models/authentication/request/access_token_request.dart';
import 'package:lincus_maternity/models/authentication/request/refresh_token_request.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/general_response_model.dart';
import 'package:lincus_maternity/models/measurement/request/update_measurement_comment_request.dart';
import 'package:lincus_maternity/models/measurement/request/update_measurement_request.dart';
import 'package:lincus_maternity/models/measurement/response/get_latest_measurement_response.dart';
import 'package:lincus_maternity/models/measurement/response/get_measurement_option_response.dart';
import 'package:lincus_maternity/models/pregnancy/response/get_pregnancy_detail_response.dart';
import 'package:lincus_maternity/models/survey/response/get_available_survey_response.dart';
import 'package:lincus_maternity/models/survey/response/get_survey_detail_response.dart';
import 'package:lincus_maternity/models/urls.dart';
import 'package:lincus_maternity/models/wellbeing/response/get_wellbeing_score_response.dart';
import 'package:lincus_maternity/services/jwt_decoder.dart';
import 'dart:convert';
import 'dart:io';

import 'package:lincus_maternity/stores/locator.dart';
import 'package:validators/validators.dart';

class ApiService {
  Client http;

  ApiService() {
    http = new Client();
  }

  Future<AccessToken> getAccessToken({String username, String password}) async {
    var response = new AccessToken();
    if (username.isNotEmpty && password.isNotEmpty) {
      var request = new AccessTokenRequest(
          username: username,
          password: password,
          grantType: AppConstants.grantTypePassword,
          clientId: AppConstants.client_id,
          clientSecret: AppConstants.client_secret);
      final api_response = await anonymousPost(
          url: AppUrls.get_access_token_url, postData: request.toJson());
      response = AccessToken.fromJson(api_response);
    }
    return Future<AccessToken>.value(response);
  }

  Future<BasicInfoResponse> getUserBasicInfo() async {
    var response = new BasicInfoResponse();
    final apiResponse = await protectedGet(AppUrls.get_basic_info_url);
    response = BasicInfoResponse.fromJson(apiResponse);
    return Future<BasicInfoResponse>.value(response);
  }

  Future<GetWellbeingScoreResponse> getWellbeingScore() async {
    var response = new GetWellbeingScoreResponse();
    final apiResponse = await protectedGet(AppUrls.get_wellbeing_score_url);
    response = GetWellbeingScoreResponse.fromJson(apiResponse);
    return Future<GetWellbeingScoreResponse>.value(response);
  }

  Future<GetMeasurementOptionResponse> getMeasurementOption() async {
    var response = new GetMeasurementOptionResponse();
    final apiResponse = await protectedGet(AppUrls.get_measurement_option_url);
    response = GetMeasurementOptionResponse.fromJson(apiResponse);
    return Future<GetMeasurementOptionResponse>.value(response);
  }

  Future<GetPregnancyDetailResponse> getPregnancyDetails() async {
    var response = new GetPregnancyDetailResponse();
    final apiResponse = await protectedGet(AppUrls.get_pregnancy_details_url);
    response = GetPregnancyDetailResponse.fromJson(apiResponse);
    return Future<GetPregnancyDetailResponse>.value(response);
  }

  Future<GetLatestMeasurementResponse> getLatestMeasurement() async {
    var response = new GetLatestMeasurementResponse();
    final apiResponse = await protectedGet(AppUrls.get_measurement_latest_url);
    response = GetLatestMeasurementResponse.fromJson(apiResponse);
    return Future<GetLatestMeasurementResponse>.value(response);
  }

  Future<GetAvailableSurveyResponse> getAvailableSurvey() async {
    var response = new GetAvailableSurveyResponse();
    final apiResponse = await protectedGet(AppUrls.get_available_survey_url);
    response = GetAvailableSurveyResponse.fromJson(apiResponse);
    return Future<GetAvailableSurveyResponse>.value(response);
  }

  Future<GeneralResponseModel> updateMeasurement(
      UpdateMeasurementRequest updateMeasurementRequest) async {
    var response = new GeneralResponseModel();
    if (updateMeasurementRequest != null) {
      final api_response = await protectedPost(
          url: AppUrls.update_measurement_url,
          postData: updateMeasurementRequest.toJson());
      response = GeneralResponseModel.fromJson(api_response);
    }
    return Future<GeneralResponseModel>.value(response);
  }

  Future<GeneralResponseModel> updateMeasurementComment(String id,
      UpdateMeasurementCommentRequest updateMeasurementRequest) async {
    String url = '${AppUrls.update_measurement_url}/$id';
    var response = new GeneralResponseModel();
    if (updateMeasurementRequest != null) {
      final api_response = await protectedPut(
          url: url, postData: updateMeasurementRequest.toJson());
      response = GeneralResponseModel.fromJson(api_response);
    }
    return Future<GeneralResponseModel>.value(response);
  }

  Future<GetSurveyDetailResponse> getSurveyDetail(String id) async {
    String url = '${AppUrls.get_survey_detail}/$id';
    var response = new GetSurveyDetailResponse();
    if (id != null) {
      final api_response = await protectedGet(url);
      response = GetSurveyDetailResponse.fromJson(api_response);
    }
    return Future<GetSurveyDetailResponse>.value(response);
  }

  _decodeResponse(Response response) => json.decode(response.body);

  Future<dynamic> anonymousGet(String url) async {
    var responseJson;
    try {
      final response = await http.get(url, headers: getDefaultHeader());
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> protectedGet(String url) async {
    var responseJson;
    try {
      await checkAndUpdateAccessToken();
      final response = await http.get(url, headers: getProtectedHeader());
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> anonymousPost(
      {String url, Map<String, dynamic> postData}) async {
    var responseJson;
    print("request:($postData)");
    try {
      final response = await http.post(url,
          headers: getDefaultHeader(), body: jsonEncode(postData));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> protectedPost(
      {String url, Map<String, dynamic> postData}) async {
    print("request:($postData)");
    var responseJson;
    try {
      await checkAndUpdateAccessToken();
      final response = await http.post(url,
          headers: getProtectedHeader(), body: jsonEncode(postData));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> protectedPut(
      {String url, Map<String, dynamic> postData}) async {
    print("request:($postData)");
    var responseJson;
    try {
      await checkAndUpdateAccessToken();
      final response = await http.put(url,
          headers: getProtectedHeader(), body: jsonEncode(postData));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw InvalidInputException('Invalid request');
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InvalidInputException('Invalid request');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Map<String, String> getProtectedHeader() {
    //String accessToken = AppLocator.current_user.accessToken?.accessToken ?? '';
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer ${AppLocator.current_user.accessToken?.accessToken ?? ''}',
    };
  }

  Map<String, String> getDefaultHeader() {
    //String accessToken = AppLocator.current_user.accessToken?.accessToken ?? '';
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      //HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    };
  }

  Future<bool> checkAndUpdateAccessToken() async {
    try {
      if (AppLocator.current_user.accessToken != null &&
          !isNull(AppLocator.current_user.accessToken.accessToken)) {
        bool isExpired = JwtDecoder.isExpired(
            AppLocator.current_user.accessToken.accessToken);
        if (isExpired) {
          var request = new RefreshTokenRequest(
              refreshToken: AppLocator.current_user.accessToken.refreshToken,
              grantType: AppConstants.grantTypeRefreshToken,
              clientId: AppConstants.client_id,
              clientSecret: AppConstants.client_secret);
          final api_response = await anonymousPost(
              url: AppUrls.get_access_token_url, postData: request.toJson());
          var accessToken = AccessToken.fromJson(api_response);
          if (accessToken != null && !isNull(accessToken.accessToken)) {
            await AppLocator.preferences_service.saveAccessToken(accessToken);
            AppLocator.current_user.accessToken = accessToken;
          }
        }
      }
    } catch (e) {}
    return Future<bool>.value(true);
  }
}
