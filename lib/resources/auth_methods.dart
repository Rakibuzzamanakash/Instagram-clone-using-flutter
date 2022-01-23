import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/resources/storage_method.dart';

class AuthMethods{
 final FirebaseAuth _auth = FirebaseAuth.instance;
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Future<model.User> getUserDetails() async{
   User currentUser = _auth.currentUser!;
   DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();

   return model.User.fromSnap(snap);
 }

 // sign up user
 Future <String> signUpUser({
   required String email,
   required String password,
   required String username,
   required String bio,
   required Uint8List file, 
  //  
 }) async{
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty||username.isNotEmpty||bio.isNotEmpty){
         //register user
         UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        
        print(cred.user!.uid);
        String photoUrl = await StorageMethods()
        .uploadImageToStorage('profilePics', file, false);
        // 
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = 'success';
      }
    }catch(err){
      res =err.toString();
    }
    return res;
 }
 //login user
  Future<String> loginUser ({
    required String email,
    required String password,
  }) async{
   
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       res = 'success';
      }else{
        res = 'please enter all the fields';
      }

    }catch(err){
       res =err.toString();
    }
    return res;

  }
}