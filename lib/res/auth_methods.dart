//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/Storage_methods.dart';



class AuthMethods {

  final FirebaseAuth _auth = FirebaseAuth.instance;
 // AuthMethods (this._auth);
User get user  =>_auth.currentUser!;
Stream<User?> get authstate => FirebaseAuth.instance.authStateChanges();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get databaseReference => null;
  //signup user

  Future<String> signUpUser({

    required String bio,
    required String username,
    required String email,
    required String gender,
    required String phonenumber,
    required String password,
    required String catagoriesname,
    required Uint8List file,
    // required Uint8List file,

  }) async {

    String res = "some error occured";
    try
    {
      if(username.isNotEmpty ||email.isNotEmpty || password.isNotEmpty || gender.isNotEmpty || bio.isNotEmpty || phonenumber.isNotEmpty || catagoriesname.isNotEmpty)
      {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        //add user to database

        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);
        
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'uid':cred.user!.uid,
          'username': username,
          'email':email,
          'password':password,
          'bio':bio,
          'gender':gender,
          'phone_number':phonenumber,
          'category':catagoriesname,
          'photoUrl':photoUrl,
          
        });

        res = "success";
      }
      else
        {
          Text("please enter all the feilds");
        }

    }
    catch(err)
    {
      res = err.toString();

    }
    print(res);
    return res;
  }

  //log in
  Future<String> loginUser({
    required String email,
    required String password,

  })async {
    String res = "some error occured";

    try{
      if(email.isNotEmpty||password.isNotEmpty)
      {

        await _auth.signInWithEmailAndPassword(email: email, password: password);




        res = "success";
      }
else {
  res = "please enter all the feilds";
      }


    }
     catch(err)
    {

      Text('$err');
      res = err.toString();
    }
    return res;
  }
}