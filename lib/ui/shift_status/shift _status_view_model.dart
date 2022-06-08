import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sarc/core/locator.dart';
import '../../core/router.router.dart';
import '../../data/polls_repository.dart';

class ShiftStatusViewModle extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final pllsRepo = locator<PollsRepository>();
  late List<Map<String, String>> cancelListRow;
  cancelList() async {
    cancelListRow = await pllsRepo.getShiftCancel();
    print(cancelListRow);
  }

  void navToStatus() {
    navigation.navigateTo(Routes.shiftStatusView);
  }
}
