import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:sarc/ui/shared/my_drawer.dart';
import 'package:stacked/stacked.dart';
import '../pdf/pdf_view_model.dart';

class Pdf2View extends StatefulWidget {
  const Pdf2View({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Pdf2ViewState();
  }
}

class Pdf2ViewState extends State<Pdf2View> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PdfViewModel>.reactive(
      builder: (context, model, _) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
                title: const Text(
                  " أرقام الأطباء ",
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
            ).fromAsset('assets/images/3pdf.pdf'),
          )),
      viewModelBuilder: () => PdfViewModel(),
      onModelReady: (model) {
        // model.copyAsset();
      },
    );
  }
}
