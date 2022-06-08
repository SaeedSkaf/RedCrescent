import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sarc/core/locator.dart';
import 'package:sarc/core/router.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sizer/sizer.dart';

main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  // if ([null].contains(SwitchServerUtil().getEnvironmentType())) {
  //   SwitchServerUtil().saveEnvironmentType(url: EnvironmentType.TEST);
  // }
  runApp(const App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          MaterialApp(
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        title: 'SARC',
        theme: ThemeData(primarySwatch: Colors.red),
        navigatorObservers: const [
          // BotToastNavigatorObserver()
        ],
        builder: (context, child) {
          // BotToastInit()
          child = ExtendedNavigator<StackedRouter>(
            name: 'app_main_router',
            navigatorKey: StackedService.navigatorKey,
            router: StackedRouter(),
          );
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: Stack(
                children: [child],
              ));
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
