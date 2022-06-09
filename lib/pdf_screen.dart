import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath;

   final pdfBackend = Get.arguments! as String;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadPDF().then((value) {
      setState(() {
        localPath = value;
      });
    });
  }





  Future<String> loadPDF() async {
    var response = await http.get(Uri.parse(pdfBackend));

    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
