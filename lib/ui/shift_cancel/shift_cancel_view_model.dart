import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarc/core/shared_prefrence_repository.dart';
import 'package:sarc/data/polls_repository.dart';
import 'package:sarc/data/services.dart';
import 'package:sarc/models/person_model.dart';
import 'package:sarc/models/shift_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sarc/core/locator.dart';

class ShiftCancleViewModel extends BaseViewModel {
  final sharedPreferencesRepository = locator<SharedPreferencesRepository>();
  final navigation = locator<NavigationService>();
  final pllsRepo = locator<PollsRepository>();
  final services = locator<Services>();
  String? selectedTimeShift;
  String? selectedDate;
  final TextEditingController alternativeName = TextEditingController();

  Future<String?> sendRequest(
      String fullName, String selectedTimeShift, String selectedDate) async {
    try {
      int? rId;

      for (var x in services.idList!) {
        if (x.date == selectedDate && x.shiftTime == selectedTimeShift) {
          rId = (x.id!);
        }
      }
      Person user = sharedPreferencesRepository.getUserInfo();
      String pId = user.id.toString();
      print(pId);
      print(fullName);
      print(rId);
      return await pllsRepo.shiftCancellation(pId, fullName, rId.toString());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<List<String>?> orderStatus() async {
    try {
      Person user = sharedPreferencesRepository.getUserInfo();
      String pId = user.id.toString();
      print(pId);
      List<String>? listResult = await pllsRepo.getStatus(pId);
      return listResult;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }
}
