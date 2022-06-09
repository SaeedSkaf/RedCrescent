import 'package:sarc/core/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/router.router.dart';

class HomeViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();

  void navToPdf() {
    navigation.navigateTo(Routes.pdfView);
  }

  void navToMap() {
    navigation.navigateTo(Routes.mapView);
  }

  void navToPdf1() {
    navigation.navigateTo(Routes.pdf1View);
  }

  void navToPdf2() {
    navigation.navigateTo(Routes.pdf2View);
  }

  void navToPdf3() {
    navigation.navigateTo(Routes.pdf3View);
  }

  void navToPdf4() {
    navigation.navigateTo(Routes.pdf4View);
  }

  void navTocancle() {
    navigation.navigateTo(Routes.shiftCancelView);
  }

  void navToRegistration() {
    navigation.navigateTo(Routes.shiftRegistrationView);
  }
}
