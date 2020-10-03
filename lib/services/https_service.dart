import 'package:http/http.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/authentication/access_token.dart';
import 'package:lincus_maternity/models/authentication/request/access_token_request.dart';
import 'package:lincus_maternity/models/enums/misc_enums.dart';
import 'package:lincus_maternity/models/urls.dart';
import 'dart:convert';
import 'dart:io';
class ApiService{
  var http;
  ApiService(){
    http = new Client();
  }

   Future<AccessToken> get_access_token({String username,String password}) async {
    var response = new AccessToken();
    if(username.isNotEmpty && password.isNotEmpty) {
      var request = new AccessTokenRequest(username: username,
          password: password,
          grantType: GrantType.password.toString(),
          clientId: AppConstants.client_id,
          clientSecret: AppConstants.client_secret);
      Response api_response = await http.post(AppUrls.get_access_token_url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            //HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        body:request.toJson()
      );
      if (api_response.statusCode == 200) {
        var jsonResponse = _decodeResponse(api_response);
        response = AccessToken.fromJson(jsonResponse);
      } else {
        print('Request failed with status: ${api_response.statusCode}.');
      }
    }
    return response;
  }
  _decodeResponse(Response response) =>
      json.decode(response.body);
}
