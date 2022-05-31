import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
   String ?localPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiServiceProvider.loadPDF().then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodingBoot Flutter PDF Viewer",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: localPath != null
          ? PDFView(
        filePath: localPath,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}





class ApiServiceProvider {
  static final String BASE_URL = "https://www.ibm.com/downloads/cas/GJ5QVQ7X";

  static Future<String> loadPDF() async {
    var response = await http.get(Uri.parse(BASE_URL));

    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}