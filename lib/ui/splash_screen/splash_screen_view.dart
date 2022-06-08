import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sarc/core/locator.dart';
import 'package:sarc/core/router.router.dart';
import 'package:sarc/core/shared_prefrence_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  getLoggedIn() {
    Future.delayed(const Duration(seconds: 3), () async {
      final navigation = locator<NavigationService>();
      final sharedPreferencesRepository =
          locator<SharedPreferencesRepository>();
      if (sharedPreferencesRepository.getLoggedIn()) {
        navigation.replaceWith(Routes.homeView);
      } else {
        navigation.replaceWith(Routes.loginView);
      }
    });
  }

  @override
  void initState() {
    getLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mdw = MediaQuery.of(context).size.width;
    final mdh = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            color: const Color.fromARGB(255, 241, 242, 244),
            constraints: const BoxConstraints.expand(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      height: mdh * 0.45,
                      width: mdw * 0.45,
                      child: Image.asset("assets/images/3.png"),
                    ),
                  )
                ])));
  }
}
