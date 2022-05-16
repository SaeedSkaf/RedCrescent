import 'package:sarc/core/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/router.router.dart';
import '../login/login_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final loginModel = locator<LoginViewModel>();
  final title = "الصفحة الرئيسية";
  String? fname;
  String? lname;
  String? userType;

  void navToPdf() {
    navigation.navigateTo(Routes.pdfsView,
        arguments: PdfsViewArguments(
          name: "advs",
          title: "الدليل المركزي الموحد للإسعاف الأولي",
        ));
  }

  void navToMap() {
    navigation.navigateTo(Routes.mapView);
  }

  void navToRegistration() {
    navigation.navigateTo(Routes.shiftRegistrationView);
  }
}
