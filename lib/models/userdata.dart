import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class User1 {
 // final String uid;
  final String bio;
  final String email;
  final String password;
  final String phonenumber;
  final String usernamee;
  final String category;


  User1({required this.bio,required this.email, required this.password, required this.phonenumber,required this.usernamee,required this.category});
}