import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarc/ui/cancel/cancel_view_model.dart';
import 'package:stacked/stacked.dart';

import '../shared/my_drawer.dart';

class CancelView extends StatefulWidget {
  const CancelView({Key? key}) : super(key: key);

  @override
  _CancelViewState createState() => _CancelViewState();
}

class _CancelViewState extends State<CancelView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CancelViewModel>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                  title: Text("الغاء المناوبات"),
                  backgroundColor: Colors.red,
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.call), onPressed: () {})
                  ]),
              drawer: MyDrawer(),
            )),
        viewModelBuilder: () => CancelViewModel());
  }
}
