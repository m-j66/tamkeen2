import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of item on sale

  final List _categories = [
    //[itemName,ImagePath,Color]
    ["Arts and Craft", "assets/images/arts and craft.png", Colors.lightGreen],
    ["Photography", "assets/images/photography.png", Colors.yellow],
    ["Sewing", "assets/images/sewing.png", Colors.brown],
    ["Cooking", "assets/images/cooking.png", Colors.cyan],
  ];

  get categories => _categories;
}
