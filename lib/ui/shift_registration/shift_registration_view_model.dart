import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sarc/data/polls_repository.dart';
import 'package:sarc/data/service.dart';
import 'package:sarc/models/person_model.dart';
import 'package:stacked/stacked.dart';
import '../../core/locator.dart';
import 'package:date_utils/date_utils.dart' as imp;
import '../login/login_view_model.dart';
import 'package:sarc/ui/login/login_view_model.dart';

class ShiftRegistrationViewModel extends BaseViewModel {
  final pllsRepo = locator<PollsRepository>();
  final loginViewModel = locator<LoginViewModel>();
  List<DataRow> dataRows = [];
  List<String>? tableShifts;
  String? selectedWeek;
  String selectedDay = "اختر التاريخ";
  String? selectedTimeShift;
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  int? daysInMonth;
  int shiftId = 0;

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

  loadTableShifts() async {
    // String username = await ReadCache.getString(key: 'username');
    // String password = await ReadCache.getString(key: 'password');
    //Person? user = await pllsRepo.getUser(username, password);
    // print(44444444);
    // Person? user = service.p;
    // print(11111111111);
    // print(user!.fname);

    try {
      // showLoader();
      List<String>? temp = await pllsRepo.getTableShifts(
          loginViewModel.user!.id.toString(), selectedWeek!);

      // hideLoader()
      if (temp!.isNotEmpty) {
        tableShifts = temp;
        print(tableShifts);
      } else {
        throw Exception("empty list");
      }
    } catch (e) {
      print(e);
      // hideLoader();
    }
  }
}
