import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarc/core/locator.dart';
import 'package:stacked/stacked.dart';
import '../../data/polls_repository.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final pllsRepo = locator<PollsRepository>();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController passOld = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  bool isObscureFirst = true;
  bool isObscureSecond = true;
  bool isObscureThird = true;

  Future<String?> confirmChanagePassword(
      String username, String oldPass, String newPass) async {
    try {
      String? result = await pllsRepo.changePass(username, oldPass, newPass);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
    }
    return null;
  }
}
