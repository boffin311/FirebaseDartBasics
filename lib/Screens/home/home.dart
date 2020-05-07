import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_starting/Screens/add_brew/add_brew.dart';
import 'package:firebase_starting/models/SingleCoffeeModel.dart';
import 'package:firebase_starting/services/auth.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  DatabaseReference singleClientRef;
  DatabaseReference dbref = FirebaseDatabase.instance.reference();

  List<SingleCoffeeModel> _coffeeModelList = List<SingleCoffeeModel>();
  AuthServices _auth = AuthServices();
  StreamSubscription _onAddSubscription;

  @override
  void initState() {
    _auth.currentUser.then((uid) {
      DatabaseReference _brewQuery = dbref.child("Users").child(uid);
      _onAddSubscription = _brewQuery.onChildAdded.listen(_onEntryAdded);
    });

    super.initState();
  }

  _onEntryAdded(Event event) {
    setState(() {
      _coffeeModelList.add(SingleCoffeeModel.fromSnapShot(event.snapshot));
    });
  }

  @override
  void dispose() {
    _onAddSubscription.cancel();
    super.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
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
        body: Container(
            child: ListView.builder(
                itemCount: _coffeeModelList.length,
                itemBuilder: ((BuildContext context, int index) {
                  return ListTile(
                    title: Text("${_coffeeModelList[index].coffeeName}"),
                    leading: CircleAvatar(backgroundColor: Colors.brown[_coffeeModelList[index].coffeeLevel*100],),
                    subtitle: Text("${_coffeeModelList[index].coffeeSugar}"),
                  );
                }))),
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
