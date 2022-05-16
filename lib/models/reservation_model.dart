class Reservation {
  int? id;
  String? day;
  String? shiftTime;

  Reservation({this.id, this.day, this.shiftTime});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day_in_month'];
    shiftTime = json['shift_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day_in_month'] = day;
    data['shift_time'] = shiftTime;
    return data;
  }
}
