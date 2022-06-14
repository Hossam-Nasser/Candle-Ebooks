import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class BooksScreenFirebase extends StatefulWidget {
  @override
  _BooksScreenFirebaseState createState() => _BooksScreenFirebaseState();
}

class _BooksScreenFirebaseState extends State<BooksScreenFirebase> {


  FirebaseFirestore firestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 200,
          height: 200,
          child: StreamBuilder(
            stream: firestore.collection("books").snapshots(),
            builder: (ctx, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final docs = snapshot.data.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("${docs[index]["title"]}"),
                        Text("${docs[index]["author"]}"),
                        Text("${docs[index]["date_added"]}"),
                        Image.network("${docs[index]["cover"]}")



                      ],
                    ),
                  );
                }
              );
            },
          )
        ),
      )
    );
  }
}
