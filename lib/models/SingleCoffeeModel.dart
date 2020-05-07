import 'package:firebase_database/firebase_database.dart';

class SingleCoffeeModel{
  String coffeeName;
  int coffeeSugar;
  int coffeeLevel;

  SingleCoffeeModel({this.coffeeLevel,this.coffeeName,this.coffeeSugar});

  Map<String,dynamic> getMap(SingleCoffeeModel model){
    return{
        "coffeeName":model.coffeeName,
        "coffeeSugar": model.coffeeSugar,
        "coffeeLevel":model.coffeeLevel
    };
  }
  SingleCoffeeModel.fromSnapShot(DataSnapshot snapshot):
  coffeeName= snapshot.value["coffeeName"],
  coffeeLevel=snapshot.value["coffeeLevel"],
  coffeeSugar=snapshot.value["coffeeSugar"];
                                       
}