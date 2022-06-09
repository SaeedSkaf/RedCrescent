import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarc/core/shared_prefrence_repository.dart';
import 'package:sarc/data/polls_repository.dart';
import 'package:sarc/data/services.dart';
import 'package:sarc/models/person_model.dart';
import 'package:sarc/models/result_model.dart';
import 'package:sarc/models/shift_model.dart';
import 'package:stacked/stacked.dart';
import '../../core/locator.dart';
import 'package:date_utils/date_utils.dart' as imp;
import '../login/login_view_model.dart';
import 'package:sarc/ui/login/login_view_model.dart';

class ShiftRegistrationViewModel extends BaseViewModel {
  List<String> tableShifts = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " "
  ];
  final sharedPreferencesRepository = locator<SharedPreferencesRepository>();
  final pllsRepo = locator<PollsRepository>();
  final loginViewModel = locator<LoginViewModel>();
  final services = locator<Services>();
  List<Shift> shiftsList = [];
  String? selectedWeek;
  String selectedDay = "اختر التاريخ";
  String? selectedTimeShift;
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  int? daysInMonth;
  int shiftId = 0;
  int getLock = 0;
  String choice = "";

  int getDaysInMonth(int currentYear, int currentMonth) {
    var date = DateTime(currentYear, currentMonth);
    var lastDay = imp.DateUtils.lastDayOfMonth(date);
    return (lastDay.day);
  }

  TableRow headerTableRow() {
    return const TableRow(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(3),
          child: Text("التاريخ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))),
      Padding(
          padding: EdgeInsets.all(3),
          child: Text("الفترة الأولى",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))),
      Padding(
          padding: EdgeInsets.all(3),
          child: Text("الفترة الثانية",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))),
      Padding(
          padding: EdgeInsets.all(3),
          child: Text("الفترة الثالثة",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))),
    ]);
  }

  TableRow tableRow(String first, String second, String third, String forth) {
    Color getColor(String type) {
      if (type == "متاح") {
        return Colors.green;
      } else if (type == "حجزته مسبقا") {
        return Colors.blue;
      } else {
        return Colors.red;
      }
    }

    return TableRow(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Text(first,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ))),
      Padding(
          padding: const EdgeInsets.all(3),
          child: Text(second,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getColor(second),
              ))),
      Padding(
          padding: const EdgeInsets.all(3),
          child: Text(third,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getColor(third),
              ))),
      Padding(
          padding: const EdgeInsets.all(3),
          child: Text(forth,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getColor(forth),
              ))),
    ]);
  }

  void getId() async {
    final pllsRepo = locator<PollsRepository>();
    List<Shift>? idData = await pllsRepo.getResId();
    services.getAllId(idData!);
  }

  Future<List<String>?> loadTableShifts(
      String selectedWeek, String type) async {
    try {
      Person user = sharedPreferencesRepository.getUserInfo();
      String id = user.id.toString();
      List<String>? tempTableShifts =
          await pllsRepo.getTableShifts(id, selectedWeek, type);
      return tempTableShifts;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<Result?> sendShifts(List<Shift> shifts, String type) async {
    try {
      print(type);
      Person user = sharedPreferencesRepository.getUserInfo();
      String id = user.id.toString();
      List<int> rIdList = [];
      List<Result> resultList = [];
      for (var x in shifts) {
        for (var y in services.idList!) {
          if (x.date == y.date && x.shiftTime == y.shiftTime) {
            rIdList.add(y.id!);
          }
        }
      }
      print(id);
      print(rIdList);

      await pllsRepo
          .bookShift(id, rIdList, type)
          .then((value) => {resultList = value!});
      return resultList[0];
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }
}
