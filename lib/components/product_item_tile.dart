import 'package:tamkeen2/pages/ANC.dart';
import 'package:tamkeen2/pages/Cooking_page.dart';
import 'package:tamkeen2/pages/Photography_page.dart';
import 'package:tamkeen2/pages/Sewing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemTile extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final color;
  final int index;

  const ProductItemTile(
      {super.key,
      required this.itemName,
      required this.imagePath,
      required this.color,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ANC(),
      Photography(),
      Sewing(),
      Cooking(),
    ];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //image
          Image.asset(
            imagePath,
            height: 70,
          ),

          MaterialButton(
            onPressed: () {
              // Navigate to the corresponding page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]),
              );
            },
            color: color,
            child: Text(itemName, style: GoogleFonts.bebasNeue(fontSize: 15)),
          ),
        ]),
      ),
    );
  }
}
