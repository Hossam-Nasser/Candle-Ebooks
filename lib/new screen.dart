import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class new_screen extends StatefulWidget {
  const new_screen({Key? key}) : super(key: key);

  @override
  State<new_screen> createState() => _new_screenState();
}

class _new_screenState extends State<new_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Icon(Icons.menu),
        title: Text('title'),centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
