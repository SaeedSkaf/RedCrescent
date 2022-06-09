class Shift {
  int? id;
  String? date;
  String? shiftTime;

  Shift({this.id, this.date, this.shiftTime});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['day_in_month'];
    shiftTime = json['shift_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day_in_month'] = date;
    data['shift_time'] = shiftTime;
    return data;
  }
}
