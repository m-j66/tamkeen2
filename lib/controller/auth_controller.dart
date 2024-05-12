import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signup user

  Future<String> signUpUser({
    required String fullname,
    required String username,
    required String email,
    required String gender,
    required String phonenumber,
    required String password,
    required String catagoriesname,
   // required Uint8List file,
  }) 
  async {
    String res = "some error occured";
    try
        {
          if(username.isNotEmpty ||email.isNotEmpty || password.isNotEmpty || gender.isNotEmpty || fullname.isNotEmpty || phonenumber.isNotEmpty || catagoriesname.isNotEmpty /||file != null/ )
            {
              //register user
             UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
             print(cred.user!.uid);
             //add user to database
             await _firestore.collection('users').doc(cred.user!.uid).set({
                'username': username,
                'uid':cred.user!.uid,
                'email':email,
               'password':password,
               'gender':gender,
               'full_name':fullname,
               'phone_number':phonenumber,
               'category':catagoriesname,
              });
             res = "success";
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
  required String username,
  required String password,
  required String phonenumber,
}
)
async {
String res = "some error occured";
try{
  if(email.isNotEmpty||password.isNotEmpty||phonenumber.isNotEmpty)
    {
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       await _auth.signInWithPhoneNumber(phonenumber);
      res = "success";
    }
  else
    {
      res = "Please enter all the fields";
    }
}
catch(err)
  {
    res = err.toString();
  }
  return res;
}

uploadImage(File image) async{
}
   /* authController.storeUserInfo(
      selectedImage!,
      nameController.text,
      pnoneNumberController.text,
      emailController.text,
      )*/
storeUserInfo(File? selectedImage,String name, String PhoneNumber, 
String Email, String dob, String Password, String Category,String url)
async{ 
  String url_new = url;
  if(selectedImage != null)
  {
       String url= await uploadImage(selectedImage);
  }
  String uid= FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.collection('users').doc(uid).set({
    'image': url,
    'name': name,
    'pnoneNumber': PhoneNumber,
    'email': Email,
    'dateOfBirth': dob,
    'password': Password,
    'category': Category
  }).then((value)
  {
  /*  isProfileUploading(false);
    Get.to(()=>HomeScreen());*/
  });
}
}*/