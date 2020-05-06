import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_starting/models/UserModel.dart';

class AuthServices{

  final FirebaseAuth _auth=FirebaseAuth.instance;


  //create UserModel form firebase user

  UserModel getUserModel(FirebaseUser user){
    if(user!=null){
      return  UserModel(uid: user.uid);
    }
    else{return null;}
  }
   Stream<UserModel> get userStream{
     return _auth.onAuthStateChanged.map((FirebaseUser fuser)=>getUserModel(fuser));
   }
  //
  //sign anon

  Future signingAnom() async{
    try{
    AuthResult result=await _auth.signInAnonymously();
    FirebaseUser user=result.user;
    return getUserModel(user);
    }catch(e){
       print("exception");
       return null;
    }
  }

  //sign with email and password

  //signUp with email and password  

  //sign out
   Future signOutUser()async{
     try{
     return await _auth.signOut();
     }
     catch(e){
       print(e.toString());
       return null;
     }
   }
}