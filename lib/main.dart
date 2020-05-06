
import 'package:firebase_starting/Screens/myWidget.dart';
import 'package:firebase_starting/models/UserModel.dart';
import 'package:firebase_starting/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.blue,statusBarBrightness: Brightness.light));
    return StreamProvider<UserModel>.value(
      value:AuthServices().userStream,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyWidget(),
      ),
    );
  }
}
