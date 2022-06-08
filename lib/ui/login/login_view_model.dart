import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarc/core/locator.dart';
import 'package:sarc/core/shared_prefrence_repository.dart';
import 'package:sarc/data/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sarc/models/person_model.dart';
import '../../core/router.router.dart';
import '../../data/polls_repository.dart';

class LoginViewModel extends BaseViewModel {
  //final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final sharedPreferencesRepository = locator<SharedPreferencesRepository>();
  final navigation = locator<NavigationService>();
  final pllsRepo = locator<PollsRepository>();
  final services = locator<Services>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isObscure = true;
  Person? user;
  String errorMessage = " ";

  login(String? username, String? password) async {
    if (username == "" && password == "") {
      errorMessage = "الرجاء إدخال اسم المسستخدم وكلمة المرور";
    } else if (username == "") {
      errorMessage = "الرجاء إدخال اسم المستخدم";
    } else if (password == "") {
      errorMessage = "الرجاء إدخال كلمة المرور";
    } else {
      try {
        user = await pllsRepo.getUser(username!, password!);
        if (user!.result != 'invalid') {
          sharedPreferencesRepository.setLoggedIn(isLoggedIn: true);
          sharedPreferencesRepository.saveUserInfo(user: user!);
          errorMessage = " ";
          navigation.replaceWith(Routes.homeView);
        } else {
          errorMessage = "اسم المستخدم أو كلمة المرور خاطئة";
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
      }
    }
  }

  void navToChangePassword() {
    navigation.navigateTo(Routes.changePasswordView);
  }
}
