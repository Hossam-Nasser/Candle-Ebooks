import 'package:candle_ebookv2/firebaes/books_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hossam"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Get.to(BooksScreenFirebase()),
      ),
    );
  }
}
