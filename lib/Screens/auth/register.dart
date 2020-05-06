import 'package:firebase_starting/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _authServices = AuthServices();
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
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Confirm Password"),
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
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(text: "Already have a account?"),
                          TextSpan(
                              text: " Sign in ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  widget.toggleView();
                                },
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
