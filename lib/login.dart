//import 'package:AudioBooks/register.dart';
import 'package:candle_ebookv2/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Mic.dart';
import 'welcom_speack/welcom_speak.dart';

import 'dart:math';

class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();



  bool _isLogin = true;

  late String _email = "";
  late String _password = "";
  late String _username = "";
  late String _number = "";
  var  userImageFile;





  void submit() {
    final isValid = _formKey.currentState!.validate();


    if (isValid) {
      _formKey.currentState!.save();
      Get.to(MicScreen());
    }
  }

  @override
  void initState() {
    TextToSpeech().speak("hellow how are you");
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
              if (_isLogin) SizedBox(height: 200,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if(!_isLogin)SizedBox(height: 50,),
                     Text(_isLogin ? 'Login' : 'Sign up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(height: 30,),
                   Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                              spreadRadius: 5
                            )
                          ]
                      ),
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
                                onSaved: (val) => _username = val!,
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    top: 2,
                                  ),
                                  child: Icon(
                                    Icons.person_outlined,
                                    color: const Color(0xff7B6F72),
                                  ),
                                ),
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey)
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
                              child: TextFormField(
                                autocorrect: false,
                                enableSuggestions: true,
                                textCapitalization: TextCapitalization.none,
                                key: ValueKey('email'),
                                validator: (val) {
                                  if (val!.isEmpty || !val.contains('@')) {
                                    return "please enter a valid email address";
                                  }
                                  return null;
                                },
                                onSaved: (val) => _email = val!,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        top: 2,
                                      ),
                                      child: Icon(
                                          Icons.email_outlined,
                                        color: const Color(0xff7B6F72),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey)
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                key: ValueKey('password'),
                                validator: (val) {
                                  if (val!.isEmpty || val.length < 7) {
                                    return "please enter at least 7 char";
                                  }
                                  return null;
                                },
                                onSaved: (val) => _password = val!,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        top: 2,
                                      ),
                                      child: Icon(
                                          Icons.lock_outline,
                                        color: const Color(0xff7B6F72),
                                      ),
                                    ),

                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey)
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                autocorrect: true,
                                enableSuggestions: false,
                                textCapitalization: TextCapitalization.words,
                                key: ValueKey('number'),
                                validator: (val) {
                                  if (val!.isEmpty || !(val.length > 4)) {
                                    return "please enter valid number";
                                  }
                                  return null;
                                },
                                onSaved: (val) => _number = val!,
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        top: 2,
                                      ),
                                      child: Icon(
                                        Icons.phone,
                                        color: const Color(0xff7B6F72),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "phone number",
                                    hintStyle: TextStyle(color: Colors.grey)
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                     Container(
                        height: 50,
                        width: 150,
                        margin: EdgeInsets.symmetric(horizontal: 95),
                        child: ElevatedButton(
                            onPressed: () => submit(),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue ,
                              elevation: 10.5,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0)),
                            ),
                            child: Text(_isLogin ? 'Login' : 'Sign up', style: TextStyle(color: Colors.white,fontSize: 26),),
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
      _email ="guest${rng.nextInt(1000000)}@yahoo.com";
      _password ="12345678";
      _username = "guest${rng.nextInt(1000000)}";

    print(_email);
    print(_password);
    print(_username);


    //
    Get.offAll(MicScreen());
  }



}
