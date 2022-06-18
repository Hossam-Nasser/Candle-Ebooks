//import 'package:AudioBooks/register.dart';
import 'dart:convert';

import 'package:candle_ebookv2/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Mic.dart';
import 'book/view/mic_screen.dart';
import 'welcom_speack/welcom_speak.dart';
import 'json.dart';
import 'dart:math';

class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}
var email = TextEditingController();
var password = TextEditingController();
var userName = TextEditingController();
var phoneNumber = TextEditingController();
LoginValid? uservaild;

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();


  bool _isLogin = true;

  // late String email = "";
  // late String _password = "";
  // late String _username = "";
  // late String _number = "";
  var  userImageFile;
  void submitFromLogin() {
    final isValid = _formKey.currentState!.validate();


    if (isValid) {
      _formKey.currentState!.save();
      // var backendemail = _email;
      // var backendpassword = _password;
      Get.to(MicScreen());
    }
  }

  void submitFromRegister() {
    final isValid = _formKey.currentState!.validate();


    if (isValid) {
      _formKey.currentState!.save();
      Get.to(MicScreen1());
    }
  }


  @override
  void initState() {
    TextToSpeech().speak("Hello and Welcome to Candle Ebooks "
        "your gate to hall new world of knowledge "
        "please enter on the bottom of the screen if you cant log in or you cant create account manually");
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
           image:DecorationImage(
             image: NetworkImage("https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80"),
             fit: BoxFit.cover,
               opacity: 0.4
           )
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               SizedBox(height: 200,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if(!_isLogin)SizedBox(height: 50,),
                       Center(child: Text(_isLogin ? 'Login' : 'Sign up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),)),
                      SizedBox(height: 30,),
                     Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              if (!_isLogin) Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.white70
                                    ))
                                ),
                                child: Container(
                                  color: Colors.white70,
                                  child: TextFormField(
                                    autocorrect: true,
                                    enableSuggestions: false,
                                    textCapitalization: TextCapitalization.words,
                                    key: ValueKey('username'),
                                    validator: (val) {
                                      if (val!.isEmpty || !(val.length > 4)) {
                                        return "please enter at least 4 char";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) => userName.text = val!,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      prefixIcon: Icon(
                                        Icons.person,
                                      ),
                                      border: OutlineInputBorder(
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.white70
                                    ))
                                ),
                                child: Container(
                                  color: Colors.white70,
                                  child: TextFormField(
                                    autocorrect: false,
                                    enableSuggestions: true,
                                    textCapitalization: TextCapitalization.none,
                                    key: ValueKey('email'),
                                    validator: (val) {
                                      if (val!.isEmpty || !val.contains('@')&& val.length<4) {
                                        return "please enter a valid email address";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) => email.text = val!,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  color: Colors.white70,
                                  child: TextFormField(
                                    key: ValueKey('password'),
                                    validator: (val) {
                                      if (val!.isEmpty || val.length < 7) {
                                        return "please enter at least 7 char";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) => password.text = val!,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(
                                        Icons.lock,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              if (!_isLogin) Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.white70
                                    ))
                                ),
                                child: Container(
                                  color: Colors.white70,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    autocorrect: true,
                                    enableSuggestions: false,
                                    textCapitalization: TextCapitalization.words,
                                    key: ValueKey('number'),
                                    validator: (val) {

                                      return null;
                                    },
                                    onSaved: (val) => phoneNumber.text = val!,
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      prefixIcon: Icon(
                                        Icons.phone,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                       Center(
                         child: Container(
                            height: 50,
                            width: 290,
                            child: ElevatedButton(
                                onPressed: () {
                                  _isLogin ?submitFromLogin(): submitFromRegister();
                                } ,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue ,
                                  elevation: 10.5,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(20.0)),
                                ),
                                child: Text(_isLogin ? 'Login' : 'Sign up', style: TextStyle(color: Colors.white,fontSize: 20),),
                              ),


                      ),
                       ),

                      SizedBox(height: 30,),
                       Center(child:  TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? 'Create account'
                            : 'I already have an account', style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6) , fontWeight: FontWeight.bold),),
                      )),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height *0.4,
                  width: double.infinity,
                  child: InkWell(

                    onTap: ()=>generateAccountForBlindPeople(),
                    child:Text("") ,
                  ),
                )
              ],
    ),
          ),
        ),

    );
  }


  var rng = Random();
  generateAccountForBlindPeople(){
      email.text ="guest${rng.nextInt(1000000)}@yahoo.com";
      password.text ="12345678";
      userName.text = "guest${rng.nextInt(1000000)}";

    print(email);
    print(password);
    print(userName);


    //
    Get.to(MicScreen1());
  }


}
