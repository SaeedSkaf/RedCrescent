import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:sarc/core/locator.dart';
import 'package:sarc/data/service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sarc/models/person_model.dart';
import '../../core/router.router.dart';
import '../../data/polls_repository.dart';

class LoginViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final pllsRepo = locator<PollsRepository>();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
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
      user = await pllsRepo.getUser(username!, password!);
      if (user!.result != 'invalid') {
        // service.setPerson(user!);
        // WriteCache.setString(key: 'username', value: username);
        // WriteCache.setString(key: 'password', value: password).whenComplete(() {
        //   navigation.replaceWith(Routes.homeView);
        // });
        errorMessage = " ";
        navigation.replaceWith(Routes.homeView);
      } else {
        errorMessage = "اسم المستخدم أو كلمة المرور خاطئة";
      }
    }
  }
}
