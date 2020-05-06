
import 'package:firebase_starting/services/auth.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AuthServices _auth=AuthServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
          child: RaisedButton(onPressed: ()async{
              await _auth.signOutUser();
          },
          child: Text("Sign Out"),),
      ),
    );
  }
}