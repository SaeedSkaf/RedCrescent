import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:sarc/core/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/router.router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String username = "username";
  String password = "password";

  void getDrawer() async {
    username = await ReadCache.getString(key: 'username');
    password = await ReadCache.getString(key: 'password');
  }

  @override
  void initState() {
    getDrawer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(username),
          accountEmail: Text(password),
          currentAccountPicture: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          decoration: const BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
                image: AssetImage("assets/images/2.jpg"), fit: BoxFit.cover),
          ),
        ),
        ListTile(
            title: const Text(
              "الصفحة الرئيسية ",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.red,
            ),
            onTap: () {
              locator<NavigationService>().clearStackAndShow(Routes.homeView);
            }),
        ListTile(
          title: const Text(
            "تسجيل والغاء المناوبات",
            style: TextStyle(color: Colors.black, fontSize: 14),
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
              " عرض المناوبات",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            leading: const Icon(
              Icons.vpn_key_outlined,
              color: Colors.red,
            ),
            onTap: () {
              locator<NavigationService>().navigateTo(Routes.showShiftsView);
            }),
        const Divider(
          color: Colors.redAccent,
          thickness: 1.5,
        ),
        ListTile(
            title: const Text(
              " حول التطبيق ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.warning_amber_sharp,
              color: Colors.red,
            ),
            onTap: () {}),
        ListTile(
            title: const Text(
              " الاعدادات ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.settings_rounded,
              color: Colors.red,
            ),
            onTap: () {}),
        ListTile(
            title: const Text(
              " تسجيل الخروج ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onTap: () {}),
      ],
    ));
  }
}
