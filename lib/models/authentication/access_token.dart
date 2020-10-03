import 'package:json_annotation/json_annotation.dart';
part 'access_token.g.dart';
@JsonSerializable()
class AccessToken {
  @JsonKey(defaultValue: 0)
  int status;
  @JsonKey(defaultValue: "")
  String message;
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'expires_in')
  int expiresIn;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  AccessToken(
      {this.tokenType, this.expiresIn, this.accessToken, this.refreshToken});
  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
  /*AccessToken.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }*/

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }*/
}