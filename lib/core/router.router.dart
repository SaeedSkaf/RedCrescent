// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/cancel/cancel_view.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view.dart';
import '../ui/map/maps_view.dart';
import '../ui/my_profile/my_profile_view.dart';
import '../ui/pdf/pdf_view.dart';
import '../ui/shift_registration/shift_registration_view.dart';
import '../ui/show_shifts/show_shifts_view.dart';

class Routes {
  static const String loginView = '/';
  static const String homeView = '/home-view';
  static const String cancelView = '/cancel-view';
  static const String mapView = '/map-view';
  static const String myProfileView = '/my-profile-view';
  static const String pdfsView = '/pdfs-view';
  static const String showShiftsView = '/show-shifts-view';
  static const String shiftRegistrationView = '/shift_registration_view';
  static const all = <String>{
    loginView,
    homeView,
    cancelView,
    mapView,
    myProfileView,
    pdfsView,
    showShiftsView,
    shiftRegistrationView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.cancelView, page: CancelView),
    RouteDef(Routes.mapView, page: MapView),
    RouteDef(Routes.myProfileView, page: MyProfileView),
    RouteDef(Routes.pdfsView, page: PdfsView),
    RouteDef(Routes.showShiftsView, page: ShowShiftsView),
    RouteDef(Routes.shiftRegistrationView, page: ShiftRegistrationView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    CancelView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CancelView(),
        settings: data,
      );
    },
    MapView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MapView(),
        settings: data,
      );
    },
    MyProfileView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MyProfileView(),
        settings: data,
      );
    },
    PdfsView: (data) {
      var args = data.getArgs<PdfsViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PdfsView(
          key: args.key,
          name: args.name,
          title: args.title,
        ),
        settings: data,
      );
    },
    ShowShiftsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShowShiftsView(),
        settings: data,
      );
    },
    ShiftRegistrationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShiftRegistrationView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PdfsView arguments holder class
class PdfsViewArguments {
  final Key? key;
  final String name;
  final String title;
  PdfsViewArguments({this.key, required this.name, required this.title});
}
