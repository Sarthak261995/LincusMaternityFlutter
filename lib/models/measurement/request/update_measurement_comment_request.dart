class UpdateMeasurementCommentRequest {
  String comments;

  UpdateMeasurementCommentRequest({this.comments});

  UpdateMeasurementCommentRequest.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    return data;
  }
}
