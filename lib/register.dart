//import 'package:AudioBooks/Mic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Mic.dart';
import 'login.dart';
class register extends StatelessWidget {
  var emailregister = TextEditingController();
  var passwordregister = TextEditingController();
  var usernameregister = TextEditingController();
  var phoneregister= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,),
          ), systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,

                        ),),
                      SizedBox(height: 20,),
                      Text("Create an account, It's free ",
                        style: TextStyle(
                            fontSize: 15,
                            color:Colors.grey[700]),)


                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameregister,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value)
                        {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        controller: emailregister,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (String value)
                        {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                              Icons.alternate_email_outlined
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        controller: passwordregister,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value)
                        {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        controller: phoneregister,
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (String value)
                        {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          prefixIcon: Icon(
                            Icons.phone_android,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),


                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),



                        )

                    ),
                    child: MaterialButton(
                      onPressed :()
                      {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MicScreen() ,
                        ),);
                        print(emailregister.text);
                        print(passwordregister.text);
                        print(usernameregister.text);
                        print(phoneregister.text);

                      },
                      minWidth: double.infinity,
                      height: 60,
                      color: Colors.blue[800],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "Sign up", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,

                      ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => login() ,
                        ),);
                      },
                        child: Text
                          ('login'),
                      ),
                    ],
                  ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text("Already have an account?"),
                  //         Container(
                  //          child: MaterialButton(
                  //           onPressed :() {
                  //             Navigator.push(context, MaterialPageRoute(
                  //               builder: (context) => login(),
                  //             ),);
                  //
                  //             child:
                  //             Text(" Login", style: TextStyle(
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 18
                  //             ),
                  //             );
                  //           }
                  //          ),
                  //     )
                  //
                  //
                  //
                  //   ],
                  //
                  // ),


                ],

              ),

            )
        )
    );
  }
}
@override
Widget buildLeading(BuildContext context){
  return IconButton(onPressed: (){
    close(context, null);
  }, icon: Icon(Icons.arrow_back),);
}

void close(BuildContext context, param1) {
}
// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,

        decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}