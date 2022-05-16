import 'package:flutter/material.dart';
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
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
    return null;
  }

  Future<Reservation?> getResId(String day, String shiftTime) async {
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.getResIdEndpoint);
      var response = await http.post(url);
      var responseBody = jsonDecode(response.body);
      responseBody.forEach((dynamic x) {
        Reservation res = Reservation.fromJson(x);
        if (res.day == day && res.shiftTime == shiftTime) {
          return res;
        }
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
    return null;
  }

  Future<List<Result>?> bookShift(int pId, int rId) async {
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.bookShiftEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"pid": pId, "rid": rId}));
      var responseBody = jsonDecode(response.body);
      List<Result>? result;
      responseBody.forEach((dynamic x) {
        Result tempResult = Result.fromJson(x);
        result!.add(tempResult);
      });
      return result;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
    return null;
  }

  Future<List<String>?> getTableShifts(String pId, String selectedWeek) async {
    // return Future.delayed(Duration.zero);
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.getTableShiftsEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"pid": pId, "selectedWeek": selectedWeek}));
      var responseBody = jsonDecode(response.body);
      List<String>? tableShifts;
      responseBody.forEach((dynamic x) {
        String tempResult = x.toString();
        tableShifts!.add(tempResult);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
    return null;
  }
}
