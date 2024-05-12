import 'package:tamkeen2/pages/Category_page.dart';
import 'package:flutter/material.dart';

import '../pages/ANC.dart';
import '../pages/Cooking_page.dart';
import '../pages/Sewing_page.dart';

class cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
            children: [
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  TextButton(onPressed: (){},
                        child: Text("Photography",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.pink[900]
                        )),
                              style: TextButton.styleFrom(backgroundColor: Colors.red[300],
                              ),
                            
                    ),
                  ),
        
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child:
                      Container(
                        child: TextButton(onPressed: (){  Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context) => ANC() ));},
                        child: Text("Arts & Crafts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.pink[900]
                        )),
                               style: TextButton.styleFrom(backgroundColor: Colors.red[300],
                               ),
                               ),
                      ),
                   ),
                    Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: 
                     Container(
                       child: TextButton
                       (onPressed: (){  Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context) => Sewing())
                                   );
                                   },
                        child: Text("Knitting & Sewing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.pink[900]
                        )),
                               style: TextButton.styleFrom(backgroundColor: Colors.red[300],
                               ),
                               ),
                     ),
                   ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                  Container(
                    child: TextButton(onPressed: (){  Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context) => Cooking()));},
                        child: Text("Cooking",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.pink[900]
                        )),
                    style: TextButton.styleFrom(backgroundColor: Colors.red[300],
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                  Container(
                    child: TextButton(onPressed: (){  Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context) => HomePage()));},
                            child: Text("See More",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )),
                            style: TextButton.styleFrom(backgroundColor: Colors.white38,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                            ),
                          ),
                  ),
                ),
            ],
            
          )),
      ],
    );
     /* ListVi+ew.count(crossAxisCount:3,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          childAspectRatio: width / (height / 4),
          children: [
          TextButton(onPressed: (){},
              child: Text("Photography",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.pink[900]
              )),
          style: TextButton.styleFrom(backgroundColor: Colors.red[300],
          ),
          ),
          TextButton(onPressed: (){},
            child: Text("Beauty",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[900]
                )),
            style: TextButton.styleFrom(backgroundColor: Colors.red[300],
               ),
          ),
          TextButton(onPressed: (){},
            child: Text("Food",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[900]
                )),
            style: TextButton.styleFrom(backgroundColor: Colors.red[300]
               ),
          )
            ],
    );*/
  }
}