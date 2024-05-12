import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tamkeen2/res/components/colors.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:tamkeen2/view/addNew.dart';
import 'package:tamkeen2/view/checkout.dart';
import 'package:tamkeen2/view/profile.dart';

class cart extends StatelessWidget {
  @override
  int _currentIndex=1;
  final String uid;
  cart( {required this.uid});
  Widget build(BuildContext context) {
  void onTabTapped(int index)
{
  if (index==2) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => AddNew(uid: uid,)
        )
      );
  }
  else if (index==3) {
      Navigator.push( context,MaterialPageRoute(builder: (context) => ProfileScreen(uid: uid,)
        )
      );
}
    else if (index==0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(uid: uid,)
        )
      );
}
}
 
 
 
    return Scaffold(

      appBar: AppBar(
        leading: BackButton(
          color: Colors.pink[900],
        ),
        title: Text(
          'MY ORDER ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.pink[900],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  Text(
                    "Order Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //items

                  Row(children: [

                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.max,
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/default.png",
                        height: 120,
                        width: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product 1",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$14.00",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    ),

                  ]),

                  Divider(
                    height: 1,
                    color: Colors.black12,
                  ),

                  Row(children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/default.png",
                        height: 120,
                        width: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product 2",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$18.00",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    )
                  ]),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment Details ",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Subtotal ",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "\$32",
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Fee",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "\$3",
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment Method ",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "E-Wallet ",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$35.00",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  check_out(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink[900],
                          ),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  )

                ],
              ),
            ),
          ])), bottomNavigationBar: BottomNavigationBar(
           // currentIndex: _currentIndex,
            backgroundColor: Color.fromARGB(254, 248, 235, 245),
            selectedItemColor: AppColors.pinkColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: ' ',

                
              ),
            
            ],
          onTap: onTabTapped, 

          ),
    );
  }
}