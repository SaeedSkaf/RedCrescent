import 'package:flutter/material.dart';
import 'package:sarc/ui/shift_status/shift%20_status_view_model.dart';
import '../shared/my_drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sarc/core/locator.dart';

class ShiftStatusView extends StatefulWidget {
  const ShiftStatusView({Key? key}) : super(key: key);

  @override
  _ShiftStatusView createState() => _ShiftStatusView();
}

class _ShiftStatusView extends State<ShiftStatusView> {
  final navigation = locator<NavigationService>();
  var shiftcan = [
    {
      "name": "عبدالكافي بريجاوي",
      "text": "أريد الغاء (مناوبة اولى) والبديل هو(.......)",
    },
    {
      "name": "عبدالكافي بريجاوي",
      "text": "أريد الغاء (مناوبة اولى) والبديل هو(.......)",
    },
    {
      "name": "عبدالكافي بريجاوي",
      "text": "أريد الغاء (مناوبة اولى) والبديل هو(.......)",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShiftStatusViewModle>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          model.cancelList();
                        })
                  ],
                  centerTitle: true,
                  title: const Text(
                    'طلبات الإلغاء',
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.red.shade600,
                ),
                drawer: MyDrawer(),
                body: ListView.builder(
                  itemCount: shiftcan.length,
                  itemBuilder: (context, i) {
                    return SizedBox(
                        child: Card(
                      child: Column(children: [
                        ListTile(
                          leading: const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 25,
                              )),
                          title: Text(
                            "${shiftcan[i]['name']}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          trailing: const Icon(Icons.filter_list),
                          subtitle: Text(
                            "${shiftcan[i]['text']}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.only(right: 70),
                                child: RaisedButton(
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    focusColor: Colors.red,
                                    onPressed: () {},
                                    child: const Text("قبول الطلب"))),
                            Container(
                                padding: const EdgeInsets.only(right: 100),
                                child: RaisedButton(
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    focusColor: Colors.red,
                                    onPressed: () {},
                                    child: const Text(
                                      "الغاء الطلب",
                                    )))
                          ],
                        )
                      ]),
                    ));
                  },
                ))),
        viewModelBuilder: () => ShiftStatusViewModle());
  }
}
