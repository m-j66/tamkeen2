import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tamkeen2/view/getting_started.dart';
import 'package:tamkeen2/view/profilepic.dart';
import 'package:tamkeen2/view/signin.dart';
import 'package:tamkeen2/view/splash.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'model/category_model.dart';


void main() async
{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform);
  runApp(
MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}): super(key:key);

  @override
  State<MyApp> createState()=> _MyAppState();
}

  /*bool _iconBool= false;
  IconData _iconLight= Icons.wb_sunny;
  IconData _iconDark= Icons.nights_stay;

  ThemeData _lightTheme= ThemeData(
    primarySwatch: Colors.pink,
    brightness: Brightness.light,
  )
  
  ThemeData _darkTheme= ThemeData(
    primarySwatch: Colors.pink,
    brightness: Brightness.dark,
  )*/
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     /*GetMaterialApp(
       // theme: _iconBool? _darkTheme: _lightTheme,
     //  theme: ThemeData.light(),
       //darkTheme: ThemeData.dark(),
       //themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: SignInScreen(),
        
    );*/
      return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:  insherah_splash(),
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.pink,
        ),
      ),
    );
  }
}
