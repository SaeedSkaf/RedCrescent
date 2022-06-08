// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/change_password/change_password_view.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view.dart';
import '../ui/map/maps_view.dart';
import '../ui/pdf/pdf1_view.dart';
import '../ui/pdf/pdf2_view.dart';
import '../ui/pdf/pdf3_view.dart';
import '../ui/pdf/pdf4_view.dart';
import '../ui/pdf/pdf_view.dart';
import '../ui/shared/app_info.dart';
import '../ui/shift_cancel/shift_cancel_view.dart';
import '../ui/shift_registration/shift_registration_view.dart';
import '../ui/shift_status/shift%20_status_view.dart';
import '../ui/show_shifts/show_shifts_view.dart';
import '../ui/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginView = '/login-view';
  static const String changePasswordView = '/change-password-view';
  static const String homeView = '/home-view';
  static const String mapView = '/map-view';
  static const String shiftCancelView = '/shift-cancel-view';
  static const String shiftStatusView = '/shift-status-view';
  static const String showShiftsView = '/show-shifts-view';
  static const String pdfView = '/pdf-view';
  static const String pdf1View = '/pdf1-view';
  static const String pdf2View = '/pdf2-view';
  static const String pdf3View = '/pdf3-view';
  static const String pdf4View = '/pdf4-view';
  static const String shiftRegistrationView = '/shift-registration-view';
  static const String appInfo = '/app-info';
  static const all = <String>{
    splashScreen,
    loginView,
    changePasswordView,
    homeView,
    mapView,
    shiftCancelView,
    shiftStatusView,
    showShiftsView,
    pdfView,
    pdf1View,
    pdf2View,
    pdf3View,
    pdf4View,
    shiftRegistrationView,
    appInfo,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.changePasswordView, page: ChangePasswordView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.mapView, page: MapView),
    RouteDef(Routes.shiftCancelView, page: ShiftCancelView),
    RouteDef(Routes.shiftStatusView, page: ShiftStatusView),
    RouteDef(Routes.showShiftsView, page: ShowShiftsView),
    RouteDef(Routes.pdfView, page: PdfView),
    RouteDef(Routes.pdf1View, page: Pdf1View),
    RouteDef(Routes.pdf2View, page: Pdf2View),
    RouteDef(Routes.pdf3View, page: Pdf3View),
    RouteDef(Routes.pdf4View, page: Pdf4View),
    RouteDef(Routes.shiftRegistrationView, page: ShiftRegistrationView),
    RouteDef(Routes.appInfo, page: AppInfo),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    LoginView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    ChangePasswordView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ChangePasswordView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    MapView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MapView(),
        settings: data,
      );
    },
    ShiftCancelView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShiftCancelView(),
        settings: data,
      );
    },
    ShiftStatusView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShiftStatusView(),
        settings: data,
      );
    },
    ShowShiftsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShowShiftsView(),
        settings: data,
      );
    },
    PdfView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const PdfView(),
        settings: data,
      );
    },
    Pdf1View: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const Pdf1View(),
        settings: data,
      );
    },
    Pdf2View: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const Pdf2View(),
        settings: data,
      );
    },
    Pdf3View: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const Pdf3View(),
        settings: data,
      );
    },
    Pdf4View: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const Pdf4View(),
        settings: data,
      );
    },
    ShiftRegistrationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShiftRegistrationView(),
        settings: data,
      );
    },
    AppInfo: (data) {
      var args = data.getArgs<AppInfoArguments>(
        orElse: () => AppInfoArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AppInfo(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AppInfo arguments holder class
class AppInfoArguments {
  final Key? key;
  final String? title;
  AppInfoArguments({this.key, this.title});
}
