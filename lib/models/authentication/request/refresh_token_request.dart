class RefreshTokenRequest {
  String grantType;
  String clientId;
  String clientSecret;
  String refreshToken;

  RefreshTokenRequest(
      {this.grantType, this.clientId, this.clientSecret, this.refreshToken});

  RefreshTokenRequest.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grant_type'] = this.grantType;
    data['client_id'] = this.clientId;
    data['client_secret'] = this.clientSecret;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
