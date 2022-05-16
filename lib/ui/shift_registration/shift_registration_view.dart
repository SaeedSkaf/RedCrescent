import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return ViewModelBuilder<ShiftRegistrationViewModel>.reactive(
      builder: (context, model, _) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                  title: const Text("حجز المناوبات "),
                  backgroundColor: Colors.red,
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.refresh), onPressed: () {})
                  ]),
              drawer: MyDrawer(),
              body: ListView(children: <Widget>[
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 250,
                          height: 40,
                          margin: const EdgeInsets.all(5),
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
                                      child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            v,
                                            textAlign: TextAlign.center,
                                          )),
                                      value: v,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              // model.loadData(
                              //     model.loginViewModel.user!.id.toString(),
                              //     model.selectedWeek!);
                              setState(() {
                                model.selectedWeek = val.toString();
                              });
                            },
                            value: model.selectedWeek,
                          ))),
                      Padding(
                          padding: const EdgeInsets.all(5),
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
                              model.tableRow("23", "متاح", "غير متاح", "محجوز"),
                              model.tableRow("23", "متاح", "غير متاح", "محجوز"),
                              model.tableRow("23", "متاح", "غير متاح", "محجوز"),
                              model.tableRow("23", "متاح", "غير متاح", "محجوز"),
                              model.tableRow("23", "متاح", "غير متاح", "محجوز"),
                              model.tableRow("23", "متاح", "غير متاح", "محجوز"),
                              model.tableRow("23", "متاح", "غير متاح", "محجوز")
                            ],
                          )),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(children: [
                        Container(
                            width: 120,
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
                                      model.daysInMonth = model.getDaysInMonth(
                                          model.currentYear,
                                          model.currentMonth);
                                      DatePicker.showDatePicker(context,
                                          theme: DatePickerTheme(
                                              headerColor: Colors.grey,
                                              backgroundColor:
                                                  Colors.red.shade400,
                                              itemStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              doneStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          showTitleActions: true,
                                          minTime: DateTime(model.currentYear,
                                              model.currentMonth, 1),
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
                          width: 75,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 35, top: 10),
                            width: 120,
                            child: DropdownButton(
                              icon: const Icon(Icons.arrow_drop_down),
                              iconEnabledColor: Colors.black54,
                              underline: Divider(
                                  color: Colors.red.shade400,
                                  height: 1,
                                  thickness: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
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
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              v,
                                              textAlign: TextAlign.center,
                                            )),
                                        value: v,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  model.selectedTimeShift = val.toString();
                                });
                              },
                              value: model.selectedTimeShift,
                            ))
                      ]),
                      const SizedBox(
                        height: 5,
                      ),
                      ButtonTheme(
                          padding: const EdgeInsets.only(top: 5),
                          minWidth: 150.0,
                          height: 35.0,
                          child: RaisedButton(
                            child: const Text('إضـافـة',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            textColor: Colors.white,
                            color: Colors.red.shade400,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            onPressed: () {
                              // model.loadTableShifts();
                              if (model.selectedDay != "اختر التاريخ") {
                                if (model.selectedTimeShift != null) {
                                  model.shiftId++;
                                  setState(() {
                                    model.dataRows.add(DataRow(cells: [
                                      DataCell(Text(model.shiftId.toString())),
                                      DataCell(Text(model.selectedDay)),
                                      DataCell(Text(model.selectedTimeShift!)),
                                      DataCell(IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                          ),
                                          iconSize: 23,
                                          color: Colors.red,
                                          onPressed: () {
                                            setState(() {
                                              model.dataRows.removeAt(0);
                                            });
                                          })),
                                    ]));
                                  });
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "قم باختيار التاريخ و الفترة",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 18.0);
                              }
                            },
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      if (model.dataRows.isNotEmpty)
                        DataTable(columns: const [
                          DataColumn(label: Text('الرقم')),
                          DataColumn(label: Text('التاريخ ')),
                          DataColumn(label: Text('الفترة')),
                          DataColumn(label: Text('حـذف '))
                        ], rows: model.dataRows)
                    ]))
              ]))),
      onModelReady: (model) {},
      viewModelBuilder: () => ShiftRegistrationViewModel(),
    );
  }
}
