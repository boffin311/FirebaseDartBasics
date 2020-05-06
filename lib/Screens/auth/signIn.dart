import 'package:firebase_starting/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInUser extends StatefulWidget {
  final Function toggleView;
  SignInUser({this.toggleView});
  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  AuthServices _authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome Back, ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign in to continue , ",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey[600], fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                        height: 60.0,
                        width: 60.0,
                        image: AssetImage("assets/images/man_image.png")),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Password"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password? ",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "- Or -",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          dynamic result = await _authServices.signingAnom();
                          if (result == null) {
                            print("an error occurred");
                          } else {
                            print("Singed in");
                            print(result.uid);
                          }
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Sign as Guest User"),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(text: "Do not have a account?"),
                          TextSpan(
                            
                          
                              text: " Create one ",
                              recognizer: TapGestureRecognizer()..onTap = (){
                                print("I am tapped");
                                widget.toggleView();},
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15.0))
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
