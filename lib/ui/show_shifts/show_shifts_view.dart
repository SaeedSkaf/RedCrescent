import 'package:flutter/material.dart';
import 'package:sarc/ui/shared/my_drawer.dart';
import 'package:sizer/sizer.dart';

class ShowShiftsView extends StatefulWidget {
  const ShowShiftsView({Key? key}) : super(key: key);

  @override
  _ShowShiftsViewState createState() => _ShowShiftsViewState();
}

class _ShowShiftsViewState extends State<ShowShiftsView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
                title: const Text("عرض المناوبات "),
                backgroundColor: Colors.red.shade600,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(icon: const Icon(Icons.refresh), onPressed: () {})
                ]),
            drawer: MyDrawer(),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Title(
                            color: Colors.black,
                            child: const Text(
                              "مناوبات الفترة الأولى",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Table(
                                defaultColumnWidth: const FixedColumnWidth(65),
                                border: TableBorder.all(
                                  style: BorderStyle.solid,
                                  width: 3,
                                ),
                                children: [
                                  TableRow(children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text("الأيام",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("السبت",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("الأحد",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("الإثنين",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("الثلاثاء",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("الأربعاء",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("الخميس",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Text("الجمعة",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text(
                                        "قائد",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("قائد",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("كشاف",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("مسعف 1 ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("مسعف 1",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("قائد",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("قائد",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: const Text("مشترك",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                    const Text(""),
                                  ]),
                                ]),
                          ),
                          Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                Title(
                                  color: Colors.black,
                                  child: const Text(
                                    "مناوبات الفترة الثانية",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Table(
                                      defaultColumnWidth:
                                          const FixedColumnWidth(65),
                                      border: TableBorder.all(
                                        style: BorderStyle.solid,
                                        width: 3,
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الأيام",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("السبت",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الأحد",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الإثنين",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الثلاثاء",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الأربعاء",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الخميس",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Text("الجمعة",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              "قائد",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("قائد",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("كشاف",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("كشاف",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("مسعف 1 ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("قائد",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("مشترك",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                        TableRow(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("مشترك",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                          const Text(""),
                                        ]),
                                      ]),
                                ),
                                Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                      Title(
                                        color: Colors.black,
                                        child: const Text(
                                          "مناوبات الفترة الثالثة",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Table(
                                            defaultColumnWidth:
                                                const FixedColumnWidth(65),
                                            border: TableBorder.all(
                                              style: BorderStyle.solid,
                                              width: 3,
                                            ),
                                            children: [
                                              TableRow(children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text("الأيام",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text("السبت",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text("الأحد",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text("الإثنين",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text(
                                                        "الثلاثاء",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text(
                                                        "الأربعاء",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text("الخميس",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: const Text("الجمعة",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: const Text(
                                                    "قائد",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: const Text("قائد",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: const Text("كشاف",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: const Text("كشاف",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: const Text("مسعف 1 ",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: const Text("مسعف 1",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                                const Text(""),
                                              ]),
                                            ]),
                                      ),
                                      const Text(
                                        "عدد المناوبات الكلية: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]))
                              ]))
                        ]))))));
  }
}
