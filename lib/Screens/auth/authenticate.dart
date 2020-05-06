import 'package:firebase_starting/Screens/auth/register.dart';
import 'package:firebase_starting/Screens/auth/signIn.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInView=true;

 void toggleView(){
   setState(()=> showSignInView=!showSignInView);
 }
  @override
  Widget build(BuildContext context) {
    return (showSignInView)?SignInUser(toggleView: toggleView,):Register(toggleView:toggleView);
  }
}
