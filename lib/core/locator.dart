import 'package:get_it/get_it.dart';
import 'package:sarc/data/polls_repository.dart';
import 'package:sarc/ui/home/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/login/login_view_model.dart';
import '../ui/shift_registration/shift_registration_view_model.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // String deviceId = await DeviceId.getID;
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  locator.registerLazySingleton(() => sharedPreferences);
  // locator.registerLazySingleton<DeviceInfoService>(() => deviceInfoInstance);

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<PollsRepository>(() => PollsRepository());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<ShiftRegistrationViewModel>(
      () => ShiftRegistrationViewModel());
  // NavigationService x = NavigationService();
  // locator.registerLazySingleton<DialogService>(() => DialogService());
}
