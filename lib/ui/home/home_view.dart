import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'package:sarc/ui/home/home_view_model.dart';
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
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, _) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
                title: Text(model.title),
                backgroundColor: Colors.red[600],
                centerTitle: true,
                actions: <Widget>[
                  IconButton(icon: const Icon(Icons.call), onPressed: () {})
                ]),
            drawer: MyDrawer(),
            body: ListView(children: <Widget>[
              InkWell(
                child: SizedBox(
                  width: 30.w,
                  height: 15.h,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/4.jpeg",
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "الدليل المركزي الموحد للإسعاف الأولي",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: model.navToPdf,
              ),
              InkWell(
                child: SizedBox(
                  width: 30.w,
                  height: 15.h,
                  child: Card(
                    child: Row(
                      children: <Widget>[
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
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: SizedBox(
                  width: 30.w,
                  height: 15.h,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/6.png",
                            scale: 2,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              "موقع المركر الرئيسي 300 "
                              "ومواقع المراكز الفعالة في مدينة حمص",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  model.navToMap();
                },
              ),
              InkWell(
                child: SizedBox(
                  width: 30.w,
                  height: 15.h,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/8.jpg",
                            scale: 8,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "تسجيل مناوبات",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  model.navToRegistration();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: SizedBox(
                  height: 30.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                          height: 10,
                          width: 120,
                          child: ListTile(
                            title: Image.asset("assets/images/9.png"),
                            subtitle: Text(
                              " أرقام الاطباء في حمص",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {},
                          )),
                      SizedBox(
                          height: 30.h,
                          width: 40.w,
                          child: ListTile(
                              title: Image.asset("assets/images/10.jpg"),
                              subtitle: Text(
                                "أرقام المستشفيات التخصصية في حمص",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {})),
                      SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: ListTile(
                            title: Image.asset("assets/images/3.png"),
                            subtitle: Text(
                              " أرقام عمليات الهلال الاحمر ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {},
                          )),
                    ],
                  ),
                ),
              )
            ]),
          )),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) {},
    );
  }
}
