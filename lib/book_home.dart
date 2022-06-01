// import 'package:AudioBooks/book_data.dart';
// import 'package:AudioBooks/books_profile.dart';
// import 'package:AudioBooks/search.dart';
import 'package:candle_ebookv2/search.dart';
import 'package:flutter/material.dart';
import 'Mic.dart';
import 'book_data.dart';
import 'book_model.dart';
import 'books_details.dart';
import 'nvdrawer.dart';

class BooksHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(
        child: Nvdrawer(),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/moti-abebe-Y5v-wkla580-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(

          children: [

            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 70,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),

                    );
                  }),

                  // MaterialButton(onPressed: (
                  //     ){
                  //   Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => MicScreen() ,
                  //   ),
                  //   );
                  // },
                  //   child: Icon(
                  //     Icons.mic_none_rounded,
                  //     color: Colors.white,
                  //     size: 50,
                  //   ),
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => search_screen() ,
                       ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 50,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xfffff8ee),
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
                      BookSection(
                        heading: "Trending",
                      ),
                      BookSection(
                        heading: "Discover More",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookSection extends StatelessWidget {
  final String heading;
  BookSection({required this.heading});
  @override
  Widget build(BuildContext context) {
    List<Book> bookList=[];
    if (heading == "Trending") {
      bookList = recentBooks;
    } else if (heading == "Discover More") {
      bookList = allBooks;
    } else if (heading == "BookShelf") {
      bookList = allBooks;
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: MediaQuery.of(context).size.height * 0.41,
            child: ListView.builder(
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => BooksDetails(
                      index: 0,
                      section: heading,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 5,
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
                                  child: Image.asset(
                                    bookList[i].coverImage,
                                    fit: BoxFit.fill,
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
                          bookList[i].name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          bookList[i].author,
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
              itemCount: bookList.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
