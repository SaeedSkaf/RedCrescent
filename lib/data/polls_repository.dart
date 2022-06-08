import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sarc/data/urls_constants.dart';
import 'package:sarc/models/person_model.dart';
import 'package:sarc/models/reservation_model.dart';
import 'package:sarc/models/result_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PollsRepository {
  Future<Person?> getUser(String username, String password) async {
    try {
      var url =
          Uri.parse(ConstantsService.baseUrl + ConstantsService.logInEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{"username": username, "password": password}));
      var responseBody = jsonDecode(response.body);
      Person user = Person.fromJson(responseBody);
      return user;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<int?> getResId(String day, String shiftTime) async {
    int? temp;
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.getResIdEndpoint);
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);
      responseBody.forEach((dynamic x) {
        Reservation res = Reservation.fromJson(x);
        if (res.day == day && res.shiftTime == shiftTime) {
          temp = res.id!;
        }
      });
      return temp;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<List<Result>?> bookShift(
      String pId, List<int> rId, String type) async {
    List<Result> listResult = [];
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.bookShiftEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"rid": rId, "pid": pId, "type": type}));
      var responseBody = jsonDecode(response.body);
      if (responseBody is List) {
        for (var x in responseBody) {
          Result temp = Result.fromJson(x);
          listResult.add(temp);
        }
      } else {
        Result temp = Result.fromJson(responseBody);
        listResult.add(temp);
      }
      return listResult;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<List<String>?> getTableShifts(
      String pId, String selectedWeek, String type) async {
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.getTableShiftsEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              {"pid": pId, "weekNumber": selectedWeek, "type": type}));
      var responseBody = jsonDecode(response.body);
      List<String>? tableShifts;
      tableShifts = (responseBody as List<dynamic>).cast<String>();
      return tableShifts;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<dynamic> getShiftCancel() async {
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.getShiftCancelEndpoint);
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
  }

  Future<String?> shiftCancellation(
      String pId, String fullName, String rId) async {
    try {
      var url = Uri.parse(ConstantsService.baseUrl +
          ConstantsService.shiftCancellationEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"pid1": pId, "fullName": fullName, "rid": rId}));
      var responseBody = jsonDecode(response.body);
      String result = responseBody['result'];
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<List<String>?> getStatus(String pId) async {
    List<String> listResult = [];
    try {
      var url = Uri.parse(ConstantsService.baseUrl +
          ConstantsService.shiftCancelRequestEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"pid1": pId}));
      var responseBody = jsonDecode(response.body);

      for (var x in responseBody) {
        String temp = x['result'];
        listResult.add(temp);
      }
      return listResult;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<String?> changePass(
      String username, String oldPass, String newPass) async {
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.changePasswordEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "username": username,
            "old_password": oldPass,
            "new_password": newPass
          }));
      var responseBody = jsonDecode(response.body);
      String result = responseBody['result'];
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }
}
