import 'package:get_it/get_it.dart';
import 'package:sarc/core/shared_prefrence_repository.dart';
import 'package:sarc/data/polls_repository.dart';
import 'package:sarc/data/services.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/login/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // String deviceId = await DeviceId.getID;
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // locator.registerLazySingleton<DeviceInfoService>(() => deviceInfoInstance);
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepository());

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<PollsRepository>(() => PollsRepository());
  locator.registerLazySingleton<Services>(() => Services());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  // NavigationService x = NavigationService();
  // locator.registerLazySingleton<DialogService>(() => DialogService());
}
