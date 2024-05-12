import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:tamkeen2/view/forgotPassword.dart';
import 'package:tamkeen2/view/signup.dart';
import '../models/userdata.dart';
import '../res/auth_methods.dart';



class SignInScreen extends StatefulWidget
{
  const SignInScreen({super.key});

  @override
  State <SignInScreen> createState()=> _SignInScreen();
}

class _SignInScreen extends State<SignInScreen>
{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameContoller = TextEditingController();

late bool isLoggedIn;
  @override

  var _isObscured;
  void initState()
  {
    super.initState();
    _isObscured = true;
  }
  @override
  void dispose()
  {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameContoller.dispose();

  }


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
            ),


            Padding(

                padding: const EdgeInsets.all(20),


                child: ListView(

                  children: <Widget>[

                    IconButton(
                      alignment: Alignment.topLeft,
                      icon: const Icon(Icons.arrow_back,color: Color(0xFF880E4F),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(40.0),
                    ),
                    Container(


                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text("تمکین",
                          style:TextStyle(  color: Color(0xFF880E4F),
                            fontWeight: FontWeight.bold,
                            fontSize: 65,),)



                    ),

                    const Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Welcome back!',
                          style: TextStyle(fontSize: 20,color: Colors.black),
                        )),

                    Container(

                      padding: const EdgeInsets.all(20),
                      child: TextField(

                        controller:_emailController,
                        style: TextStyle( color: Color(0xFF880E4F)),
                        decoration: InputDecoration(
                          // hintText: ,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Color(0xFF880E4F),),
                          ),

                          labelText: '  Enter email',prefixIcon:Icon(Icons.supervised_user_circle_outlined, color: Color(0xFF880E4F)),


                        ),

                        //  keyboardType:,
                        //controller:_phonenumber,
                      ),
                    ),

                    Container(

                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),

                      child:TextField(
                        obscureText:_isObscured,
                        controller: _passwordController,

                        style: TextStyle( color: Color(0xFF880E4F)),

                        decoration: InputDecoration(

                          border: OutlineInputBorder(

                          ),
                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Color(0xFF880E4F),),
                          ),
                          labelText: 'Enter password',prefixIcon:Icon(Icons.lock, color: Color(0xFF880E4F)),
                          suffixIcon: IconButton(
                            padding: const EdgeInsetsDirectional.only(end: 12.0),
                            icon: _isObscured ? const Icon(Icons.visibility,color: Color(0xFF880E4F),):const Icon(Icons.visibility_off,color: Color(0xFF880E4F),),
                            onPressed: ()
                            {
                              setState(() {
                                _isObscured =!_isObscured;
                              });
                            },


                          ),



                        ),

                      ),
                    ),
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: const <Widget>[
                        Text(
                          '' ,
                          textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),
                        ),


                      ],
                    ),
                    TextButton(

                      child: const Text(
                        'forgotten password?',
                        style: TextStyle(fontSize: 15,color: Colors.black),
                      ),
                      onPressed: (

                          ) {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassScreen()),);
                        //signup screen
                      },
                    ),

                    Container(
                        height: 70,

                        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                        color: Colors.pinkAccent[300],
                        child: ElevatedButton(

                          child: const Text('Sign In',style: TextStyle(color: Colors.white), ),
                          onPressed:() async {
                            String password = _passwordController.text;
                            String username =  _usernameContoller.text;
                            String email =  _emailController.text;
                            String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
                          //  User1 user = User1(email: email,password:password,usernamee:username);



                            setState(() {
                              isLoggedIn = true;
                            });
                            print(res);
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
  if (user != null) {
    Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen( uid: user.uid,)
    ));

  }
  });
                          },



                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF880E4F), // Background color
                          ),
                        )
                    ),
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: const <Widget>[
                        Text(
                          '' ,
                          textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),
                        ),


                      ],
                    ),

                    Row(
                        children: const <Widget>[

                          Expanded(
                              child: Divider()
                          ),

                          Text("OR"),

                          Expanded(
                              child: Divider()
                          ),
                        ]
                    ),
                    Spacer(
                      flex: 78,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    TextButton(

                      child: const Text(
                        'Log In with Google',
                        style: TextStyle(fontSize: 15,color: Colors.black,),
                      ),

                      onPressed: (

                          )  {






                        /* try {
                 UserCredential userCredential = await signInWithGoogle();
  // Navigate to the next screen after successful sign-in
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
  }
  catch (e) {
               print('Sign In Error: $e');
  // Handle sign-in error
            showDialog(
               context: context,
           builder: (BuildContext context) {
               return AlertDialog(
            title: Text('Sign In Error'),
         content: Text('Failed to sign in with Google. Please try again.'),
         actions: [
              TextButton(
                child: Text('OK'),
                   onPressed: () {
                 Navigator.of(context).pop();
                     },
                ),
              ],
             );
            },
           );
         }*/

                        //signup screen
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(76.0),
                    ),
                    Column(
                      children: [
                        Divider(
                          color: Colors.grey,
                        ),

                        TextButton(

                          child: const Text(
                            ' Dont have an account?Sign Up',
                            style: TextStyle(fontSize: 15,color: Colors.black),
                          ),
                          onPressed: (

                              ) {Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()),);
                            //signup screen
                          },
                        ),



                      ],
                    ),

                  ],
                )
            ),
          ],),),

    );

  }

}