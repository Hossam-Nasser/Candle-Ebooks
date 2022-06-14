import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'json.dart';

class api extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<api> {
  Books?  data;
  // int len = int.parse(data!.total);
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://api.itbook.store/1.0/new"),
        );
        this.setState(()  {
      data = Books.fromJson(json.decode(response.body));
    });
    print(data!);
    return "Success!";
  }
  @override
  void initState() {
    super.initState();
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text("Listviews")),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data!.books.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Image.network(data!.books.elementAt(index).image),
              Text(data!.books.elementAt(index).title),
              Text(data!.books.elementAt(index).subtitle),
              Text(data!.books.elementAt(index).price)
            ],
          );

        },
      ),
    );
  }
}