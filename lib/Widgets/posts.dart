/*import 'package:flutter/material.dart';
import '../view/openpic.dart';

class Picture extends StatelessWidget {
  final String? imageUrl;
  const Picture({Key? key, this.imageUrl, required List<String> imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            // ... existing code ...
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image:imageUrl != null
                    ? NetworkImage(imageUrl!)
                    : Image.asset("assets/images/sunn.jpeg").image,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sunn.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sunn.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sunn.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sunn.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sunn.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imagePath: "assets/images/sunn.jpeg")),
            );
          },
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sunn.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}*/