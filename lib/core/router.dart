import 'package:sarc/ui/login/login_view.dart';
import 'package:sarc/ui/map/maps_view.dart';
import 'package:sarc/ui/pdf/pdf_view.dart';
import '../ui/cancel/cancel_view.dart';
import '../ui/home/home_view.dart';
import '../ui/my_profile/my_profile_view.dart';
import '../ui/show_shifts/show_shifts_view.dart';
import '../ui/shift_registration/shift_registration_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    CupertinoRoute(
      initial: true,
      page: LoginView,
    ),
    CupertinoRoute(
      page: HomeView,
    ),
    CupertinoRoute(
      page: CancelView,
    ),
    CupertinoRoute(
      page: MapView,
    ),
    CupertinoRoute(
      page: MyProfileView,
    ),
    CupertinoRoute(
      page: PdfsView,
    ),
    CupertinoRoute(
      page: ShowShiftsView,
    ),
    CupertinoRoute(
      page: ShiftRegistrationView,
    ),
  ],
)
class AppRouter {}
