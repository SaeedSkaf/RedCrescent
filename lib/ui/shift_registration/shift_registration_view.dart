import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarc/models/shift_model.dart';
import 'package:sarc/ui/shared/my_drawer.dart';
import 'package:sarc/ui/shift_registration/shift_registration_view_model.dart';
import 'package:stacked/stacked.dart';
import '../shared/my_drawer.dart';

class ShiftRegistrationView extends StatefulWidget {
  const ShiftRegistrationView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShiftRegistrationViewState();
  }
}

class ShiftRegistrationViewState extends State<ShiftRegistrationView> {
  @override
  Widget build(BuildContext context) {
    final mdw = MediaQuery.of(context).size.width;
    final mdh = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ShiftRegistrationViewModel>.reactive(
      builder: (context, model, _) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
                title: const Text("حجز المناوبات "),
                backgroundColor: Colors.red.shade600,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        if (model.selectedWeek != null && model.choice != "") {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          var tableShifts = await model
                              .loadTableShifts(
                                  model.selectedWeek!, model.choice)
                              .whenComplete(() => Navigator.pop(context));
                          setState(() {
                            model.tableShifts = tableShifts!;
                          });
                        }
                      }),
                  IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ]),
            drawer: MyDrawer(),
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: ChoiceChip(
                                      // avatar: image.asset(
                                      //     "assets/left.png",
                                      //     matchTextDirection: false,
                                      //     width: 20.0),
                                      label: const Text('إسعاف',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      selected: model.choice == 'اسعاف',
                                      onSelected: (bool selected) async {
                                        if (model.getLock == 0) {
                                          model.getId();
                                          model.getLock++;
                                        }
                                        setState(() {
                                          model.choice =
                                              (selected ? 'اسعاف' : null)!;
                                        });
                                        if (model.selectedWeek != null) {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              });
                                          var ambulance = await model
                                              .loadTableShifts(
                                                  model.selectedWeek!,
                                                  model.choice)
                                              .whenComplete(
                                                  () => Navigator.pop(context));
                                          setState(() {
                                            model.tableShifts = ambulance!;
                                          });
                                        }
                                      },
                                      selectedColor: Colors.red.shade400,
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)))),
                              Expanded(
                                  child: ChoiceChip(
                                      // avatar: image.asset(
                                      //     "assets/right.png",
                                      //     matchTextDirection: false,
                                      //     width: 20.0),
                                      label: const Text('عمليات',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      selected: model.choice == 'عمليات',
                                      onSelected: (bool selected) async {
                                        if (model.getLock == 0) {
                                          model.getId();
                                          model.getLock++;
                                        }
                                        setState(() {
                                          model.choice =
                                              (selected ? 'عمليات' : null)!;
                                        });
                                        if (model.selectedWeek != null) {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              });
                                          var operations = await model
                                              .loadTableShifts(
                                                  model.selectedWeek!,
                                                  model.choice)
                                              .whenComplete(
                                                  () => Navigator.pop(context));
                                          setState(() {
                                            model.tableShifts = operations!;
                                          });
                                        }
                                      },
                                      selectedColor: Colors.red.shade400,
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0))))
                            ]),
                        Container(
                            height: 40,
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid)),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                              isExpanded: true,
                              hint: const Text("اختر الأسبوع"),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              iconEnabledColor: Colors.red.shade400,
                              icon: const Icon(Icons.arrow_drop_down_circle),
                              items: [
                                'الأسبوع الأول',
                                'الأسبوع الثاني',
                                'الأسبوع الثالث',
                                'الأسبوع الرابع',
                                'الأسبوع الخامس',
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
                              onChanged: (val) async {
                                if (model.choice != "") {
                                  model.selectedWeek = val.toString();
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  var table = await model
                                      .loadTableShifts(
                                          model.selectedWeek!, model.choice)
                                      .whenComplete(
                                          () => Navigator.pop(context));
                                  setState(() {
                                    model.tableShifts = table!;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "يجب تحديد نوع المناوبات",
                                      gravity: ToastGravity.BOTTOM);
                                }
                              },
                              value: model.selectedWeek,
                            ))),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: mdh * 0.32,
                              child: Table(
                                border: TableBorder.all(),
                                columnWidths: const {
                                  0: FractionColumnWidth(0.15),
                                  1: FractionColumnWidth(0.283),
                                  2: FractionColumnWidth(0.283),
                                  3: FractionColumnWidth(0.283),
                                },
                                children: <TableRow>[
                                  model.headerTableRow(),
                                  model.tableRow(
                                      model.tableShifts[0],
                                      model.tableShifts[1],
                                      model.tableShifts[2],
                                      model.tableShifts[3]),
                                  model.tableRow(
                                      model.tableShifts[4],
                                      model.tableShifts[5],
                                      model.tableShifts[6],
                                      model.tableShifts[7]),
                                  model.tableRow(
                                      model.tableShifts[8],
                                      model.tableShifts[9],
                                      model.tableShifts[10],
                                      model.tableShifts[11]),
                                  model.tableRow(
                                      model.tableShifts[12],
                                      model.tableShifts[13],
                                      model.tableShifts[14],
                                      model.tableShifts[15]),
                                  model.tableRow(
                                      model.tableShifts[16],
                                      model.tableShifts[17],
                                      model.tableShifts[18],
                                      model.tableShifts[19]),
                                  model.tableRow(
                                      model.tableShifts[20],
                                      model.tableShifts[21],
                                      model.tableShifts[22],
                                      model.tableShifts[23]),
                                  model.tableRow(
                                      model.tableShifts[24],
                                      model.tableShifts[25],
                                      model.tableShifts[26],
                                      model.tableShifts[27])
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 122,
                                  height: 43,
                                  margin: const EdgeInsets.only(right: 35),
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 1.5, color: Colors.red.shade400),
                                  )),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          child: Text(
                                            model.selectedDay,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          onPressed: () {
                                            model.daysInMonth =
                                                model.getDaysInMonth(
                                                    model.currentYear,
                                                    model.currentMonth);
                                            DatePicker.showDatePicker(context,
                                                theme: DatePickerTheme(
                                                    headerColor: Colors.grey,
                                                    backgroundColor:
                                                        Colors.red.shade400,
                                                    itemStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                    doneStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16)),
                                                showTitleActions: true,
                                                minTime: DateTime(
                                                    model.currentYear,
                                                    model.currentMonth,
                                                    1),
                                                maxTime: DateTime(
                                                    model.currentYear,
                                                    model.currentMonth,
                                                    model.daysInMonth!),
                                                onChanged: (date) {
                                              setState(() {
                                                model.selectedDay =
                                                    date.day.toString();
                                              });
                                            }, onConfirm: (date) {
                                              setState(() {
                                                model.selectedDay =
                                                    date.day.toString();
                                              });
                                            },
                                                currentTime: DateTime.now(),
                                                locale: LocaleType.en);
                                          }),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 12),
                                        child: Icon(Icons.arrow_drop_down,
                                            color: Colors.black54, size: 25.0),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.only(left: 35, top: 10),
                                  width: 120,
                                  child: DropdownButton(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconEnabledColor: Colors.black54,
                                    underline: Divider(
                                        color: Colors.red.shade400,
                                        height: 1,
                                        thickness: 1.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    isExpanded: true,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    hint: const Text(
                                      "اختر الفترة",
                                      style: TextStyle(color: Colors.black),
                                    ),
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
                                        model.selectedTimeShift =
                                            val.toString();
                                      });
                                    },
                                    value: model.selectedTimeShift,
                                  ))
                            ]),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                                padding: const EdgeInsets.only(top: 5),
                                minWidth: 125.0,
                                height: 35.0,
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.red.shade400,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  onPressed: () {
                                    if (model.selectedDay != "اختر التاريخ") {
                                      if (model.selectedTimeShift != null) {
                                        model.shiftId++;
                                        setState(() {
                                          model.shiftsList.add(Shift(
                                              id: model.shiftId,
                                              date: model.selectedDay,
                                              shiftTime:
                                                  model.selectedTimeShift));
                                        });
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "قم باختيار التاريخ و الفترة",
                                            gravity: ToastGravity.BOTTOM);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "قم باختيار التاريخ و الفترة",
                                          gravity: ToastGravity.BOTTOM);
                                    }
                                  },
                                  child: const Text('إضـافـة',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                )),
                            SizedBox(
                              width: mdw * 0.19,
                            ),
                            ButtonTheme(
                                padding: const EdgeInsets.only(top: 5),
                                minWidth: 125.0,
                                height: 35.0,
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.red.shade400,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  onPressed: () async {
                                    if (model.shiftsList.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "قم بإضافة المناوبات",
                                          gravity: ToastGravity.BOTTOM);
                                    } else {
                                      if (model.choice != "") {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            });

                                        var send = await model
                                            .sendShifts(
                                                model.shiftsList, model.choice)
                                            .whenComplete(
                                                () => Navigator.pop(context));

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text("تنبيه",
                                                    textAlign:
                                                        TextAlign.center),
                                                titleTextStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                content: Text(send!.message!,
                                                    textAlign:
                                                        TextAlign.center),
                                              );
                                            });
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "يجب تحديد نوع المناوبات",
                                            gravity: ToastGravity.BOTTOM);
                                      }
                                    }
                                  },
                                  child: const Text('إرسال',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                        if (model.shiftsList.isNotEmpty)
                          Padding(
                              padding: const EdgeInsets.all(6),
                              child: Row(children: [
                                const Text("الرقم",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: mdw * 0.14,
                                ),
                                const Text("التاريخ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: mdw * 0.21,
                                ),
                                const Text("الفترة",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: mdw * 0.25,
                                ),
                                const Text("حذف",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold))
                              ])),
                        Column(
                          children: [
                            SizedBox(
                              height: mdh * 0.25,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: model.shiftsList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                        child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text((index + 1).toString()),
                                                Text(model
                                                    .shiftsList[index].date!),
                                                Text(model.shiftsList[index]
                                                    .shiftTime!),
                                                IconButton(
                                                    icon: const Icon(
                                                      Icons.delete,
                                                    ),
                                                    iconSize: 23,
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      setState(() {
                                                        model.shiftsList
                                                            .removeAt(index);
                                                      });
                                                    }),
                                              ],
                                            )));
                                  }),
                            )
                          ],
                        ),
                        const SizedBox(height: 25)
                      ])
                ],
              ),
            ),
          )),
      onModelReady: (model) {},
      viewModelBuilder: () => ShiftRegistrationViewModel(),
    );
  }
}
