import 'package:firebase_starting/Screens/auth/authenticate.dart';
import 'package:firebase_starting/Screens/home/home.dart';
import 'package:firebase_starting/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserModel>(context);
    return Container(
      child: (user==null)?Authenticate():MyHome(),
    );
  }
}