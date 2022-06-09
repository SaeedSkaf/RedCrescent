import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarc/ui/shared/my_drawer.dart';
import 'package:sarc/ui/shift_cancel/shift_cancel_view_model.dart';
import 'package:stacked/stacked.dart';

class ShiftCancelView extends StatefulWidget {
  const ShiftCancelView({Key? key}) : super(key: key);

  @override
  _ShiftCancelView createState() => _ShiftCancelView();
}

class _ShiftCancelView extends State<ShiftCancelView> {
  @override
  Widget build(BuildContext context) {
    final mdw = MediaQuery.of(context).size.width;
    final mdh = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ShiftCancleViewModel>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                    title: const Text("إلغاء المناوبات"),
                    backgroundColor: Colors.red[600],
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ]),
                drawer: MyDrawer(),
                body: SingleChildScrollView(
                    child: Stack(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: mdh * 0.06),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            controller: model.alternativeName,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.swap_horiz,
                                color: Colors.grey,
                              ),
                              //errorText: "Error",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade400)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                              ),
                              hintText: "أدخل اسم البديل هنا",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 120,
                                height: 45,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black87,
                                        width: 1.2,
                                        style: BorderStyle.solid)),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  isExpanded: true,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  hint: const Text(
                                    "اختر التاريخ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  iconEnabledColor: Colors.red.shade400,
                                  icon:
                                      const Icon(Icons.arrow_drop_down_circle),
                                  items: [
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                    '6',
                                    '7',
                                    '8',
                                    '9',
                                    '10',
                                    '11',
                                    '12',
                                    '13',
                                    '14',
                                    '15',
                                    '16',
                                    '17',
                                    '18',
                                    '19',
                                    '20',
                                    '21',
                                    '22',
                                    '23',
                                    '24',
                                    '25',
                                    '26',
                                    '27',
                                    '28',
                                    '29',
                                    '30',
                                    '31',
                                  ]
                                      .map((v) => DropdownMenuItem(
                                            value: v,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  v,
                                                  textAlign: TextAlign.center,
                                                )),
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      model.selectedDate = val.toString();
                                    });
                                  },
                                  value: model.selectedDate,
                                ))),
                            Container(
                                width: 120,
                                height: 45,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black87,
                                        width: 1.2,
                                        style: BorderStyle.solid)),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  isExpanded: true,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  hint: const Text(
                                    "اختر الفترة",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  iconEnabledColor: Colors.red.shade400,
                                  icon:
                                      const Icon(Icons.arrow_drop_down_circle),
                                  items: [
                                    'الفترة الأولى',
                                    'الفترة الثانية',
                                    'الفترة الثالثة',
                                  ]
                                      .map((v) => DropdownMenuItem(
                                            value: v,
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  v,
                                                  textAlign: TextAlign.center,
                                                )),
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      model.selectedTimeShift = val.toString();
                                    });
                                  },
                                  value: model.selectedTimeShift,
                                )))
                          ],
                        ),
                        const SizedBox(height: 50),
                        ButtonTheme(
                            minWidth: 250.0,
                            height: 40.0,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.red.shade400,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              onPressed: () async {
                                if (model.alternativeName.text.isNotEmpty &&
                                    model.selectedTimeShift != null &&
                                    model.selectedDate != null) {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  var result = await model
                                      .sendRequest(
                                          model.alternativeName.text,
                                          model.selectedTimeShift!,
                                          model.selectedDate!)
                                      .whenComplete(
                                          () => Navigator.pop(context));

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("تنبيه",
                                              textAlign: TextAlign.center),
                                          titleTextStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          content: Text(result!,
                                              textAlign: TextAlign.center),
                                        );
                                      });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "الرجاء إدخال كل البيانات",
                                      gravity: ToastGravity.BOTTOM);
                                }
                              },
                              child: const Text('إرسال الطلب',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            )),
                        const SizedBox(height: 15),
                        ButtonTheme(
                            minWidth: 120.0,
                            height: 40.0,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.grey,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              onPressed: () async {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                var oederResult = await model
                                    .orderStatus()
                                    .whenComplete(() => Navigator.pop(context));
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: const Text("تنبيه",
                                              textAlign: TextAlign.center),
                                          titleTextStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          content: Text(
                                              "${oederResult![0]}\n${oederResult[1]}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center));
                                    });
                              },
                              child: const Text('حالة الطلبات',
                                  style: TextStyle(fontSize: 18)),
                            ))
                      ]),
                ])))),
        viewModelBuilder: () => ShiftCancleViewModel());
  }
}
