import 'package:flutter/material.dart';
import 'package:sarc/ui/my_profile/my_profile_view_model.dart';

import 'package:stacked/stacked.dart';

import '../shared/my_drawer.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyProfileViewModel>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Text("الصفحة الشخصية"),
                backgroundColor: Colors.red,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.call), onPressed: () {})
                ],
              ),
              body: ListView(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "broj",
                              style: TextStyle(fontSize: 18),
                            ),
                            height: 100,
                            width: 100,
                          ),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              "عدد مناوباتي خلال الاسبوع",
                              style: TextStyle(fontSize: 18),
                            ),
                            height: 100,
                            width: 100,
                          ),
                          leading: CircleAvatar(
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "عدد مناوباتي خلال الشهر",
                              style: TextStyle(fontSize: 18),
                            ),
                            height: 100,
                            width: 100,
                          ),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              drawer: MyDrawer(),
            )),
        viewModelBuilder: () => MyProfileViewModel());
  }
}
