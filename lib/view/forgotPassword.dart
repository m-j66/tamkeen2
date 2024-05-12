
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamkeen2/view/signin.dart';
class ForgotPassScreen extends StatefulWidget
{
  const ForgotPassScreen({super.key});

  @override
  State <ForgotPassScreen> createState()=> _ForgotPassScreen();
}

class _ForgotPassScreen extends State<ForgotPassScreen>
{
  final TextEditingController _emailController = TextEditingController();
  late String email;
final auth = FirebaseAuth.instance;
@override

Future<void> resetPassword(String email) async {

  try {
    await auth.sendPasswordResetEmail(email: email);
    print("Password reset email sent successfully");
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text('Password reset link sent! Check your email',style: TextStyle(color: Color(0xFF880E4F), ),),
          );
        }
    );

  } catch (e) {
    print("Error sending password reset email: $e");
    showDialog(context: context,
        builder: (context){
      return AlertDialog(
        content: Text(e.toString(),style: TextStyle(color: Color(0xFF880E4F), ),),
      );
        }
    );
  }
}

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(



      body:SafeArea(
        child: Stack(
          children:[
            Container(

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bkk.jpg",),
                  fit: BoxFit.cover,

                ),
              ),
            ),



            Padding(


        padding: const EdgeInsets.all(20),

    child: ListView(
    children: <Widget>[
    IconButton(
    alignment: Alignment.topLeft,
    icon: const Icon(Icons.arrow_back,color: Color(0xFF880E4F),),
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()),);
    },
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
    ),
    Container(

    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),

    child: const Text("تمکین",
    style:TextStyle( color: Color(0xFF880E4F),
    fontWeight: FontWeight.bold,
    fontSize: 60,),)
      ),
     Padding(padding: const EdgeInsets.all(20),),

      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Find your account',
            style: TextStyle(fontSize: 20,color: Colors.black),
          )),
      Padding(padding: const EdgeInsets.all(20),),
      Container(

        padding: const EdgeInsets.all(20),
        child:TextField(
          controller:_emailController,



          decoration: InputDecoration(
            border: OutlineInputBorder(

            ),
            focusedBorder: OutlineInputBorder(

              borderSide: BorderSide(color: Color(0xFF880E4F),),
            ),
            labelText: 'Enter email',prefixIcon:Icon(Icons.mail_outline,color: Color(0xFF880E4F),),


          ),
        ),
      ),

      Container(
          height: 70,

          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          color: Colors.pinkAccent[300],
          child: ElevatedButton(

            child: const Text('Reset Password',style: TextStyle(color: Colors.white), ),
            onPressed: () {

              resetPassword(_emailController.text);

            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF880E4F), // Background color
            ),
          )
      ),
      Padding(padding: const EdgeInsets.all(20),),






       ],
  ),
      ),
      ],),),
    );

  }

}