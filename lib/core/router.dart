import 'package:sarc/ui/change_password/change_password_view.dart';
import 'package:sarc/ui/shared/app_info.dart';
import 'package:sarc/ui/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:sarc/ui/login/login_view.dart';
import 'package:sarc/ui/map/maps_view.dart';
import 'package:sarc/ui/pdf/pdf_view.dart';
import 'package:sarc/ui/shift_status/shift _status_view.dart';
import 'package:sarc/ui/shift_cancel/shift_cancel_view.dart';
import '../ui/home/home_view.dart';
import '../ui/pdf/pdf1_view.dart';
import '../ui/pdf/pdf2_view.dart';
import '../ui/pdf/pdf3_view.dart';
import '../ui/pdf/pdf4_view.dart';
import '../ui/shift_registration/shift_registration_view.dart';
import '../ui/show_shifts/show_shifts_view.dart';
import '../ui/change_password/change_password_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(
      initial: true,
      page: SplashScreen,
    ),
    CupertinoRoute(
      page: LoginView,
    ),
    CupertinoRoute(
      page: ChangePasswordView,
    ),
    CupertinoRoute(
      page: HomeView,
    ),
    CupertinoRoute(
      page: MapView,
    ),
    CupertinoRoute(
      page: ShiftCancelView,
    ),
    CupertinoRoute(
      page: ShiftStatusView,
    ),
    CupertinoRoute(
      page: ShowShiftsView,
    ),
    CupertinoRoute(
      page: PdfView,
    ),
    CupertinoRoute(
      page: Pdf1View,
    ),
    CupertinoRoute(
      page: Pdf2View,
    ),
    CupertinoRoute(
      page: Pdf3View,
    ),
    CupertinoRoute(
      page: Pdf4View,
    ),
    CupertinoRoute(
      page: ShiftRegistrationView,
    ),
    CupertinoRoute(
      page: AppInfo,
    ),
  ],
)
class AppRouter {}
