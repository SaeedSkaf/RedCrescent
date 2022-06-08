class Person {
  int? id;
  String? value;
  String? fullName;
  String? phone;
  String? password;
  String? username;
  String? gender;
  String? rank;
  String? camp;
  String? result;

  Person(
      {this.id,
      this.value,
      this.fullName,
      this.phone,
      this.password,
      this.username,
      this.gender,
      this.rank,
      this.camp,
      this.result});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    fullName = json['fullName'];
    phone = json['phone'];
    password = json['password'];
    username = json['username'];
    gender = json['gender'];
    rank = json['rank'];
    camp = json['camp'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['fullName'] = fullName;
    data['phone'] = phone;
    data['password'] = password;
    data['username'] = username;
    data['gender'] = gender;
    data['rank'] = rank;
    data['camp'] = camp;
    data['result'] = result;
    return data;
  }
}
