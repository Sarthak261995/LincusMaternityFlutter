class AccessTokenRequest {
  String grantType;
  String clientId;
  String clientSecret;
  String username;
  String password;
  String refreshToken;

  AccessTokenRequest(
      {this.grantType,
        this.clientId,
        this.clientSecret,
        this.username,
        this.password,
        this.refreshToken});

  AccessTokenRequest.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    username = json['username'];
    password = json['password'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grant_type'] = this.grantType;
    data['client_id'] = this.clientId;
    data['client_secret'] = this.clientSecret;
    data['username'] = this.username;
    data['password'] = this.password;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}