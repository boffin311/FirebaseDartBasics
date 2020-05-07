import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_starting/models/UserModel.dart';
import 'package:flutter/services.dart';

class AuthServices{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  
  //get Current User

  Future<String> get currentUser async{
     
     FirebaseUser user=await _auth.currentUser();
     String uid=user.uid;
     return uid;
  }
  //create UserModel form firebase user

  UserModel getUserModel(FirebaseUser user,bool isError,String errorMessage){
    if(user!=null){
      return  UserModel(uid: user.uid,isError:false,errorMessage:"");
    }
    else{return UserModel(uid: null,isError: true,errorMessage: errorMessage);}
  }
   Stream<UserModel> get userStream{
     return _auth.onAuthStateChanged.map((FirebaseUser fuser)=>getUserModel(fuser,false,""));
   }
  //
  //sign anon

  Future signingAnom() async{
    try{
    AuthResult result=await _auth.signInAnonymously();
    FirebaseUser user=result.user;
    return getUserModel(user,false,"");
    }catch(e){
       print("exception");
       return getUserModel(null,true,e.message);
    }
  }

  //sign in with email and password
  Future<UserModel> singInWithEmailAndPassword(String email,String password)async{
    try{
    final result=await _auth.signInWithEmailAndPassword(email: email, password: password);
    print(result);
    print("Yehi hua hai print");
    FirebaseUser user=result.user;
    return getUserModel(user,false,"");
    
    }catch(e){
      print(e.toString());
      print("I am in exception");
      return getUserModel(null,true,e.message);

    }
  }  

  //signUp/register with email and password

  Future<UserModel> registerWithEmailAndPassword(String email,String password)async{
    try{
    final result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    print(result);
    print("Yehi hua hai print");
    FirebaseUser user=result.user;
    return getUserModel(user,false,"");
    
    }catch(e){
      print(e.toString());
      print("I am in exception");
      return getUserModel(null,true,e.message);

    }
  }  

  //sign out
   Future signOutUser()async{
     try{
     return await _auth.signOut();
     }
     catch(e){
       print(e.toString());
       return UserModel(uid:null,isError: true,errorMessage: "");
     }
   }
}