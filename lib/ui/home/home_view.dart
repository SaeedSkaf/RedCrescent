import 'package:flutter/material.dart';
import 'package:sarc/ui/home/home_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';
import '../shared/my_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final mdw = MediaQuery.of(context).size.width;
    final mdh = MediaQuery.of(context).size.height;

    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                    title: const Text("الصفحة الرئيسية"),
                    backgroundColor: Colors.red[600],
                    centerTitle: true,
                    actions: const <Widget>[
                      // IconButton(
                      //     icon: const Icon(Icons.call),
                      //     onPressed: () {
                      //       model.navToPdf4;
                      //     })
                    ]),
                drawer: MyDrawer(),
                body: SingleChildScrollView(
                    child: Stack(children: <Widget>[
                  Column(children: [
                    SizedBox(
                      width: mdw,
                      child: InkWell(
                          onTap: model.navToPdf1,
                          child: SizedBox(
                              width: 30.w,
                              height: 12.h,
                              child: Card(
                                  child: Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    "assets/images/3.png",
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "الهيكلية العامة والنظام الداخلي لفرق الإسعاف الأولي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ])))),
                    ),
                    SizedBox(
                      width: mdw,
                      child: InkWell(
                          onTap: model.navToPdf,
                          child: SizedBox(
                              width: 30.w,
                              height: 12.h,
                              child: Card(
                                  child: Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    "assets/images/4.jpeg",
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      " الدليل المركزي الموحد للإسعاف الأولي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ])))),
                    ),
                    SizedBox(
                      width: mdw,
                      child: InkWell(
                          onTap: model.navToMap,
                          child: SizedBox(
                              width: 30.w,
                              height: 12.h,
                              child: Card(
                                  child: Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    "assets/images/disable.jpg",
                                    scale: 2,
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                        "مواقع المراكز الفعالة في مدينة حمص",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        )))
                              ])))),
                    ),
                    SizedBox(
                      width: mdw,
                      child: InkWell(
                          child: SizedBox(
                              width: 30.w,
                              height: 12.h,
                              child: Card(
                                  child: Row(children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      "assets/images/DSC_0185.jpg",
                                      scale: 8,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "تسجيل المناوبات",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ]))),
                          onTap: () {
                            model.navToRegistration();
                          }),
                    ),
                    SizedBox(
                      width: mdw,
                      child: InkWell(
                          child: SizedBox(
                              width: 30.w,
                              height: 12.h,
                              child: Card(
                                  child: Row(children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      "assets/images/13.jpg",
                                      scale: 8,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "الغاء المناوبات",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ]))),
                          onTap: () {
                            model.navTocancle();
                          }),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: mdw,
                      child: InkWell(
                          child: SizedBox(
                              height: 20.h,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: SizedBox(
                                          height: 10,
                                          width: 120,
                                          child: ListTile(
                                            title: Image.asset(
                                                "assets/images/medical-team.png",
                                                height: 80),
                                            subtitle: Text(
                                                " أرقام الاطباء في حمص",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            onTap: model.navToPdf2,
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: SizedBox(
                                          height: 20.h,
                                          width: 40.w,
                                          child: ListTile(
                                            title: Image.asset(
                                                "assets/images/hospital 3.png",
                                                height: 80),
                                            subtitle: Text(
                                                "أرقام المستشفيات في حمص",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            onTap: model.navToPdf3,
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: SizedBox(
                                          height: 20.h,
                                          width: 30.w,
                                          child: ListTile(
                                            title: Image.asset(
                                                "assets/images/call-center-service.png",
                                                height: 80),
                                            subtitle: Text(
                                                " أرقام عمليات الهلال الاحمر ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            onTap: model.navToPdf4,
                                          )),
                                    )
                                  ]))),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ])
                ])))),
        viewModelBuilder: () => HomeViewModel());
  }
}
