import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamkeen2/Widgets/privacy.dart';
import 'package:tamkeen2/Widgets/theme.dart';
import '../main.dart';
import '../res/components/colors.dart';
import '../view/change_personal_info.dart';

class settings extends StatelessWidget {
final controller=Get.put(HomeController());
final FirebaseAuth _auth= FirebaseAuth.instance;
       final String uid;
       settings({required this.uid});
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,

        children: [
          DrawerHeader(child:
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.pink
                ),
                image: DecorationImage(image: AssetImage("assets/images/prof.png"))
            ),
          )
          ),
          ListTile(
              leading: Icon(Icons.person, color: AppColors.pinkColor),
              title: Text("Edit Personal Information",
                  style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePersonalInfo(uid: uid,)),
                );
              }
          ),
          Divider(
            height: 10,
            color: Colors.black12,
          ),
          Center(child:
          Text("DISPLAY SETTINGS",
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
          ),


          ListTile(
            leading: Icon(Icons.shield_moon, color: AppColors.pinkColor),
            title: Text("Night Mode"),
            trailing: GetBuilder<HomeController>
            (
              builder: (_)=>Switch(
                value: controller.isDark,
                onChanged:(state){
                 // print('printing $state');
                controller.changeTheme(state);
              }),
            )
            ,
          /*  onTap: () {
             theme: ThemeData.dark();
            }*/
            
          ),

          Divider(
            height: 10,
            color: Colors.black12,
          ),

          Center(child:
            Text("OTHER SETTINGS", style: TextStyle(color: Colors.grey,
                fontWeight: FontWeight.bold)),
          ),

          ListTile(
            leading: Icon(Icons.help_rounded, color: AppColors.pinkColor),
            title: Text("Help and support"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

            ListTile(
            leading: Icon(Icons.lock_open_outlined, color: AppColors.pinkColor),
            title: Text("Privacy Policy"),
            onTap: () {
              Navigator.push( context,
                  MaterialPageRoute(
                      builder: (context) => const privacy()),
             );
            },
          ),
          
          ListTile(
            leading: Icon(Icons.logout_rounded ,color: AppColors.pinkColor),
            title: Text("Log Out"),
            onTap: () {
             _auth.signOut();
            },
          ),
        ]
    );
  }
}