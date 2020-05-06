import 'package:firebase_starting/models/SingleCoffeeModel.dart';
import 'package:firebase_starting/services/database.dart';
import 'package:flutter/material.dart';

class AddBrew extends StatefulWidget {
  @override
  _AddBrewState createState() => _AddBrewState();
}

class _AddBrewState extends State<AddBrew> {
  DatabaseServices _services=DatabaseServices();
  final _formKey=GlobalKey<FormState>();
  List<int> sugars = [0, 1, 2, 3, 4, 5, 6];
  String name;
  int sugarToAdd=0;
  int coffeLevel=1;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          
          Text("Upadate the BottomSheet",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          SizedBox(height:20.0),
          TextFormField(
            validator: ((val)=>(val.isEmpty)?"This field is reqquired":null),
            onChanged: (val){
              name=val;
            },
            decoration: InputDecoration(
              hintText: "Coffee Name",
            ),
          ),
          DropdownButtonFormField(
            value: sugarToAdd,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugar"),
              );
            }).toList(),
            onChanged: (int value) {
              setState(() {
                sugarToAdd=value;
              });

            },
          ),
          SizedBox(height: 20.0,),
          Slider(onChanged: (val){
            setState(() {
              coffeLevel=val.round();
            });
          },
          value: (coffeLevel?? 1).toDouble(),
          max: 5,
          min: 1,
          activeColor: Colors.blue,
          inactiveColor: Colors.blue[70],
          ),
          RaisedButton(onPressed: (){


         //Code to Upload the Data to firebase realtime Database;
                 if(_formKey.currentState.validate()){
              _services.writeData(SingleCoffeeModel(coffeeName: name,coffeeLevel:coffeLevel,coffeeSugar: sugarToAdd));
              Navigator.pop(context);
                 }

          },
          child: Text("Upload",style: TextStyle(color: Colors.white)),
          color: Colors.blue,)
        ]),
      ),
    );
  }
}
