import 'package:flutter/material.dart';

class BooksRead extends StatelessWidget {
  final String loremIpsum = 'When Alice Hale leaves a career in publicity to become a writer'
      ' and follows her husband to the New York suburbs, she is unaccustomed to filling her '
      'days alone in a big, empty house. But when she finds a vintage cookbook buried in a box in'
      ' the old homes basement, she becomes captivated by the cookbook’s previous owner—1950s housewife Nellie Murdoch.'
      ' As Alice cooks her way through the past, she realizes that within the cookbook’s pages Nellie left clues about her life—including'
      ' a mysterious series of unsent letters penned to her mother But when she finds a vintage cookbook buried in a box in'
      ' the old homes basement, she becomes captivated by the cookbook’s previous owner—1950s housewife Nellie Murdoch.'
      ' As Alice cooks her way through the past, she realizes that within the cookbook’s pages Nellie left clues about her life—including'
      ' a mysterious series of unsent letters penned to her mothe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff8ee),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 35,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 35,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 40,
                            right: 20,
                          ),
                          child: Text(
                            loremIpsum,
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.5,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
