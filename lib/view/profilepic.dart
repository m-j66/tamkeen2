
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tamkeen2/res/components/firestore_methods.dart';
import 'dart:core';


pickImage(ImageSource source)async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if(_file !=null)
    {
      return await _file.readAsBytes();
    }
  print('no image selected');
}