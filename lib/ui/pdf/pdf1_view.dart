import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:sarc/ui/pdf/pdf_view_model.dart';
import 'package:sarc/ui/shared/my_drawer.dart';
import 'package:stacked/stacked.dart';

class Pdf1View extends StatefulWidget {
  const Pdf1View({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Pdf1ViewState();
  }
}

class Pdf1ViewState extends State<Pdf1View> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PdfViewModel>.reactive(
      builder: (context, model, _) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
                title: const Text(
                  "الهيكلية العامة لفرق الإسعاف",
                  style: TextStyle(fontSize: 18),
                ),
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
            ).fromAsset('assets/images/2pdf.pdf'),
          )),
      viewModelBuilder: () => PdfViewModel(),
      onModelReady: (model) {
        // model.copyAsset();
      },
    );
  }
}
