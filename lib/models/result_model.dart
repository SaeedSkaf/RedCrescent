class Result {
  String? day;
  String? shiftTime;
  String? message;

  Result({this.day, this.shiftTime, this.message});

  Result.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    shiftTime = json['shiftTime'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['shiftTime'] = shiftTime;
    data['message'] = message;
    return data;
  }
}
