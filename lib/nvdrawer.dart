//import 'package:AudioBooks/login.dart';
import 'package:candle_ebookv2/Request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Mic.dart';
import 'books_profile.dart';
import 'login.dart';


class Nvdrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Colors.white,
      child:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'CandleEbooks',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 20  ,
              ),
              const Divider(
                height: 10,
                thickness: 1,
                endIndent: 20,
                indent: 5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BooksProfile() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.person_pin_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'profile',
                      style:
                      TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight:FontWeight.w300 ,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MicScreen() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.home_filled,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Home',
                      style:
                      TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight:FontWeight.w300 ,

                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Aboutus() ,
                  //   ),
                  // );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.info_sharp,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'About us',
                      style:
                      TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight:FontWeight.w300 ,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Contactus() ,
                  //   ),
                  // );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Settings',
                      style:
                      TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight:FontWeight.w300 ,

                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                 Get.to(ContactUs());
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.help,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Contact us',
                      style:
                      TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight:FontWeight.w300 ,

                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () async {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login() ,
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width:15 ,
                    ),
                    Text(
                      'Log out',
                      style:
                      TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight:FontWeight.w300 ,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
