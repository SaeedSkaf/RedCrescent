import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:sarc/ui/pdf/pdf_view_model.dart';
import 'package:sarc/ui/shared/my_drawer.dart';
import 'package:stacked/stacked.dart';

class PdfsView extends StatefulWidget {
  const PdfsView({Key? key, required this.name, required this.title})
      : super(key: key);
  final String name;
  final String title;

  @override
  State<StatefulWidget> createState() {
    return PdfsViewState();
  }
}

class PdfsViewState extends State<PdfsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PdfViewModel>.reactive(
      builder: (context, model, _) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
                title: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 18),
                ),
                backgroundColor: Colors.red[600],
                centerTitle: true,
                actions: <Widget>[
                  IconButton(icon: const Icon(Icons.call), onPressed: () {})
                ]),
            drawer: MyDrawer(),
            body: PDF(
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              // onPageChanged: (int page, int total) {
              //   print('page change: $page/$total');
              // },
            ).fromAsset('assets/images/${widget.name}.pdf'),
          )),
      viewModelBuilder: () => PdfViewModel(),
      onModelReady: (model) {
        // model.copyAsset();
      },
    );
  }
}
