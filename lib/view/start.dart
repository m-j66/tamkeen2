import 'package:flutter/material.dart';
import 'package:tamkeen2/view/signin.dart';
import 'package:tamkeen2/view/signup.dart';


class AppScreen extends StatefulWidget
{
  const AppScreen({super.key});

  @override
  State <AppScreen> createState()=> _AppScreen();
}

class _AppScreen extends State<AppScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[
        Container(

        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bkk.jpg",),
        fit: BoxFit.cover,

      ),
    ),


        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(
              flex: 18,
            ),
            const Center(
              child: const Text(
                'تمکین',
                  style: TextStyle(color: Color(0xFF880E4F), fontSize: 80)
              ),

            ),
            Spacer(
              flex: 20,
            ),
            const Text(

              'FOR WOMEN \n FROM WOMEN',

              style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF880E4F),fontSize: 23,),
              textAlign:TextAlign.center,
            ),

            const Padding(
              padding: EdgeInsets.all(5.0),
            ),


            Spacer(
              flex: 18,
            ),

            Container(
                height: 70,
                width: 300,
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),

                child: ElevatedButton(

                  child: const Text('Sign Up',style: TextStyle(color: Colors.white), ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()),);


                  },


                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF880E4F),
                    side: BorderSide(width:3, color:Color(0xFF880E4F)), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30),
                  ),
                )
            ),
            ),
            Spacer(
              flex: 18,
            ),

            Container(

                height: 70,
                width: 300,
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),

                child: ElevatedButton(

                  child: const Text('Sign In',style: TextStyle(color: Colors.white), ),
                  onPressed: () {

                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()),);

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xFF880E4F),
                    side: BorderSide(width:3, color:Color(0xFF880E4F)), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ) // Background color
                  ),
                ),


            Spacer(
              flex: 80,
            ),
          ],
        ),
        ),
          ],
        ),
      ),
    );
  }
}




