import 'package:http/http.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/authentication/access_token.dart';
import 'package:lincus_maternity/models/authentication/request/access_token_request.dart';
import 'package:lincus_maternity/models/enums/misc_enums.dart';
import 'package:lincus_maternity/models/exceptions/custom_exception.dart';
import 'package:lincus_maternity/models/urls.dart';
import 'dart:convert';
import 'dart:io';
class ApiService {
  var http;

  ApiService() {
    http = new Client();
  }

  Future<AccessToken> getAccessToken(
      {String username, String password}) async {
    var response = new AccessToken();
    if (username.isNotEmpty && password.isNotEmpty) {
      var request = new AccessTokenRequest(username: username,
          password: password,
          grantType: AppConstants.grantTypePassword,
          clientId: AppConstants.client_id,
          clientSecret: AppConstants.client_secret);
      final api_response = await anonymousPost(url:AppUrls.get_access_token_url,postData: request.toJson());
        response = AccessToken.fromJson(api_response);
    }
    return Future<AccessToken>.value(response);
  }

  _decodeResponse(Response response) =>
      json.decode(response.body);

  Future<dynamic> anonymousGet(String url) async {
    var responseJson;
    try {
      final response = await http.get(url,headers: getDefaultHeader());
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
  Future<dynamic> protectedGet(String url) async {
    var responseJson;
    try {
      final response = await http.get(url,headers: getProtectedHeader());
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> anonymousPost({String url,Map<String,dynamic> postData}) async {
    var responseJson;
    print("request:($postData)");
    try {
      final response = await http.post(AppUrls.get_access_token_url,
          headers:getDefaultHeader(),
          body: jsonEncode(postData));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> protectedPost({String url,Map<String,dynamic> postData}) async {
    print("request:($postData)");
    var responseJson;
    try {
      final response = await http.post(AppUrls.get_access_token_url,
          headers: getProtectedHeader(),
          body: jsonEncode(postData));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
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
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }
  Map<String,String> getProtectedHeader()
  {
    String accessToken = "";
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    };
  }
  Map<String,String> getDefaultHeader()
  {
    String accessToken = "";
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
      //HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    };
  }
}
