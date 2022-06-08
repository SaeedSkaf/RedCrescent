import 'package:flutter/material.dart';
import 'package:sarc/core/locator.dart';
import 'package:sarc/core/shared_prefrence_repository.dart';
import 'package:sarc/data/services.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/router.router.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final sharedPreferencesRepository = locator<SharedPreferencesRepository>();
  final navigation = locator<NavigationService>();
  final services = locator<Services>();
  String fullName = "";
  String phone = "";
  @override
  void initState() {
    fullName = sharedPreferencesRepository.getUserInfo().fullName!;
    phone = sharedPreferencesRepository.getUserInfo().phone!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.58,
        child: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(180, 244, 67, 54)),
              accountName: Text(
                fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                phone,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: Image.asset(
                "assets/images/staff.png",
              ),
            ),
            ListTile(
                title: const Text(
                  "الصفحة الرئيسية ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                onTap: () {
                  locator<NavigationService>()
                      .clearStackAndShow(Routes.homeView);
                }),
            ListTile(
              title: const Text(
                "تسجيل  المناوبات",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              leading: const Icon(
                Icons.call,
                color: Colors.red,
              ),
              onTap: () {
                locator<NavigationService>()
                    .navigateTo(Routes.shiftRegistrationView);
              },
            ),
            ListTile(
              title: const Text(
                "الغاء المناوبات",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              leading: const Icon(
                Icons.cancel_rounded,
                color: Colors.red,
              ),
              onTap: () {
                locator<NavigationService>().navigateTo(Routes.shiftCancelView);
              },
            ),
            // ListTile(
            //   title: const Text(
            //     "طلبات الإلغاء",
            //     style: TextStyle(color: Colors.black, fontSize: 16),
            //   ),
            //   leading: const Icon(
            //     Icons.email,
            //     color: Colors.red,
            //   ),
            //   onTap: () {
            //     locator<NavigationService>().navigateTo(Routes.shiftStatusView);
            //   },
            // ),
            // ListTile(
            //     title: const Text(
            //       " عرض المناوبات",
            //       style: TextStyle(color: Colors.black, fontSize: 16),
            //     ),
            //     leading: const Icon(
            //       Icons.vpn_key_outlined,
            //       color: Colors.red,
            //     ),
            //     onTap: () {
            //       locator<NavigationService>().navigateTo(Routes.showShiftsView);
            //     }),
            const Divider(
              color: Colors.redAccent,
              thickness: 2,
            ),
            ListTile(
                title: const Text(
                  " حول التطبيق ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                leading: const Icon(
                  Icons.warning_amber_sharp,
                  color: Colors.red,
                ),
                onTap: () {
                  locator<NavigationService>().navigateTo(Routes.appInfo);
                }),
            // ListTile(
            //     title: const Text(
            //       " الاعدادات ",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 15,
            //       ),
            //     ),
            //     leading: const Icon(
            //       Icons.settings_rounded,
            //       color: Colors.red,
            //     ),
            //     onTap: () {}),
            ListTile(
                title: const Text(
                  " تسجيل الخروج ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  sharedPreferencesRepository.logout();
                  locator<NavigationService>()
                      .clearStackAndShow(Routes.loginView);
                }),
          ],
        )));
  }
}
