import 'package:firebase_starting/Screens/add_brew/add_brew.dart';
import 'package:firebase_starting/services/auth.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AuthServices _auth = AuthServices();

  void _showBottomSheet(){
    showModalBottomSheet(context: context, builder: (context){
      return AddBrew();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Brew Picker"),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
                onTap: () async {
                  await _auth.signOutUser();
                },
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {

              _showBottomSheet();
            },
            
            child: Icon(
              Icons.add,
            )),
      ),
    );
  }
}
