import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamkeen2/Widgets/stream.dart';
import 'package:tamkeen2/view/addNew.dart';
import 'package:tamkeen2/view/cart.dart';
import 'package:tamkeen2/view/cartscreen.dart';
import 'package:tamkeen2/view/profile.dart';
import '../Widgets/Cat.dart';
import '../Widgets/Post.dart';
import '../Widgets/settings.dart';
import '../models/userdata.dart';
import '../res/components/colors.dart';


class HomeScreen extends StatelessWidget
{
  @override
  int _currentIndex=0;
  String uid;
  HomeScreen({required this.uid});

  Widget build(BuildContext context) {
    void onTabTapped(int index)
{
  if (index==2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddNew(uid: uid,)
        )
      );
  }
  else if (index==3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen(uid: uid,)
        )
      );
}
    else if (index==1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cart(uid: uid,)
        )
      );
}
}
    return Scaffold(
          appBar: AppBar(title: Text("تمکین",
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              centerTitle: true,
              backgroundColor: Colors.pink[900],
              shadowColor: Colors.grey
          ),
          drawer: Drawer(
            child: settings(uid: uid),
          ),
          body: Column(
            children: [
              cat(),
              /*Center(
                child:
                
              ),*/
              
             // Divider(color: Colors.white38, height: 7,),
             
            // Stream of posts 
              stream(), 
            ]
          )
           
          
          , bottomNavigationBar: BottomNavigationBar(
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
