import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_starting/models/SingleCoffeeModel.dart';

class DatabaseServices {
  DatabaseReference dbref = FirebaseDatabase.instance.reference();
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Create
  void writeData(SingleCoffeeModel coffeeModel) async {
    FirebaseUser user = await _auth.currentUser();
    try{
    if (user != null) {
      dbref.child("Users").child(user.uid).push().set(coffeeModel.getMap(coffeeModel)).then((val){
        print("successful");
      });
    }
    }
    catch(e){
      return null;
    }
  }
  //Read

  //Update

  //delete
}
