//import 'package:AudioBooks/book_home.dart';
import 'package:flutter/material.dart';

import 'book_home.dart';
import 'login.dart';

class BooksProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/moti-abebe-Y5v-wkla580-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.93,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.83,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xfffff8ee),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Osama Barakat",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "EDIT",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[800],
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "READS",
                                    style: kTitleStyle,
                                  ),

                                  Text(
                                    "FAVOURITES",
                                    style: kTitleStyle,
                                  ),
                                  Text(
                                    "REVIEWS",
                                    style: kTitleStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "127",
                                    style: kSubtitleStyle,
                                  ),
                                  Text(
                                    "83",
                                    style: kSubtitleStyle,
                                  ),
                                  Text(
                                    "47",
                                    style: kSubtitleStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                            alignment: Alignment.bottomCenter,
                            child: BookSection(
                              heading: "BookShelf",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/104956790.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final kTitleStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey,
  fontWeight: FontWeight.w700,
);

final kSubtitleStyle = TextStyle(
  fontSize: 26,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);
