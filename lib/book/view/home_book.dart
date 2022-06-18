import 'package:candle_ebookv2/book/models/book_model.dart';

import '../../nvdrawer.dart';
import '../controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search.dart';
import 'details_screen.dart';



class HomeBook extends GetWidget<BookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Nvdrawer(),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black45 , Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Center(child: const Text('Candle')),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => search_screen() ,
              ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],


      ),
      body: Obx(()=>controller.isLoading.value ? Center(child: CircularProgressIndicator()):Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 25,
                  left: 25,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Osama",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 30,
                        ),
                        width: 150,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue[800],
                        ),
                      ),
                      Text(
                        "recentBooks",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                height: MediaQuery.of(context).size.height * 0.41,
                                child: ListView.builder(
                                  itemBuilder: (ctx, i) => GestureDetector(
                                    onTap: () async{
                                      //await controller.getDetails(controller.books[i]!.isbn13.toString());
                                      //print("ooooooooooooooooooooooooooooooo");
                                      //print(controller.books[i]!.isbn13.toString());

                                      Get.to(DetailsBooks(book: BookModel.fromJson(controller.books.value[i]!.toJson())));
                                    },
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 10,
                                                left: 0,
                                              ),
                                              height: MediaQuery.of(context).size.height * 0.27,
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: Colors.black.withOpacity(0.4),
                                                          blurRadius: 5,
                                                          offset: Offset(8, 8),
                                                          spreadRadius: 1,
                                                        )
                                                      ],
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(20),
                                                      child: Image.network(
                                                        controller.books.value[i]!.cover,
                                                        fit: BoxFit.fill,
                                                        width: 200,
                                                        height: 800,

                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.27,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      gradient: new LinearGradient(
                                                        colors: [
                                                          Colors.black.withOpacity(0.4),
                                                          Colors.transparent,
                                                          Colors.black.withOpacity(0.4),
                                                        ],
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              controller.books.value[i]!.title,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              controller.books.value[i]!.author,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  itemCount: controller.books.value.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          )),
                      Text(
                        "discover more",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                height: MediaQuery.of(context).size.height * 0.41,
                                child: ListView.builder(
                                  itemBuilder: (ctx, i) => GestureDetector(
                                    onTap: () async{
                                      //await controller.getDetails(controller.books[i]!.isbn13.toString());
                                      //print("ooooooooooooooooooooooooooooooo");
                                      //print(controller.books[i]!.isbn13.toString());

                                      Get.to(DetailsBooks(book: BookModel.fromJson(controller.books.value[i]!.toJson())));
                                    },
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 10,
                                                left: 0,
                                              ),
                                              height: MediaQuery.of(context).size.height * 0.27,
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: Colors.black.withOpacity(0.4),
                                                          blurRadius: 5,
                                                          offset: Offset(8, 8),
                                                          spreadRadius: 1,
                                                        )
                                                      ],
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(20),
                                                      child: Image.network(
                                                        controller.books.value[i]!.cover,
                                                        fit: BoxFit.fill,
                                                        width: 200,
                                                        height: 800,

                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.27,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      gradient: new LinearGradient(
                                                        colors: [
                                                          Colors.black.withOpacity(0.4),
                                                          Colors.transparent,
                                                          Colors.black.withOpacity(0.4),
                                                        ],
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              controller.books.value[i]!.title,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              controller.books.value[i]!.author,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  itemCount: controller.books.value.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}


