class Result {
  String? dayInMonth;
  String? shiftTime;
  String? message;

  Result({this.dayInMonth, this.shiftTime, this.message});

  Result.fromJson(Map<String, dynamic> json) {
    dayInMonth = json['day_in_month'];
    shiftTime = json['shift_time'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['day_in_month'] = dayInMonth;
    data['shift_time'] = shiftTime;
    data['message'] = message;
    return data;
  }
}
