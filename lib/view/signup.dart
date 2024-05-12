import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamkeen2/view/profile.dart';
import 'package:tamkeen2/view/profilepic.dart';
import 'package:tamkeen2/view/signin.dart';

import '../res/auth_methods.dart';


class SignUpScreen extends StatefulWidget
{
  const SignUpScreen({super.key});

  @override
  State <SignUpScreen> createState()=> _SignUpScreen();
}


class _SignUpScreen extends State<SignUpScreen>
{

  final TextEditingController _bioContoller = TextEditingController();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _catagoriesnameContoller = TextEditingController();
  final TextEditingController _usernameContoller = TextEditingController();
  final TextEditingController _phonenumberContoller = TextEditingController();
  final TextEditingController _genderContoller = TextEditingController();
  final _user= User;
  Uint8List? _image;

@override

var _isObscured;

  get databaseReference => null;

void initState()
{
  super.initState();
  _isObscured = true;
}





  @override
  void dispose()
  {
    super.dispose();
    _emailContoller.dispose();
    _genderContoller.dispose();
    _passwordContoller.dispose();
    _usernameContoller.dispose();
    _phonenumberContoller.dispose();
    _catagoriesnameContoller.dispose();
    _bioContoller.dispose();
  }

void selectImage() async
{
  Uint8List im = await pickImage(ImageSource.gallery);
  setState(() {
    _image = im;

  });
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
     /* appBar: AppBar(
        toolbarHeight: 250,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Appb.jpeg'),
                  fit: BoxFit.fill
              )
          ),
        ),
     backgroundColor: Colors.red[0],
      ),*/

   Padding(

          padding: const EdgeInsets.all(20),

          child: ListView(
            children: <Widget>[
              IconButton(
                alignment: Alignment.topLeft,
              icon: const Icon(Icons.arrow_back,color: Color(0xFF880E4F),),
              onPressed: (){
                Navigator.pop(context);             },
            ),
              Container(

                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),

                  child: const Text("تمکین",
                    style:TextStyle( color: Color(0xFF880E4F),
                      fontWeight: FontWeight.bold,
                      fontSize: 60,),)


              ),
             /* Container(

*/

Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 10)),



                    //circular widget
              Center(
                child:Stack(
                  alignment: Alignment.topCenter,

                children: [
                  _image!=null?
                      CircleAvatar(



                    radius: 64,

                    backgroundImage: MemoryImage(_image!),
                  ) :const CircleAvatar(

                    radius: 64,
                    backgroundImage: AssetImage("assets/images/img3.jpg"),

                  ),
                  
                  Positioned(
                      bottom: -10,
                      left: 80,
                          child: IconButton(onPressed:selectImage,
                            icon: const Icon(Icons.add_a_photo,color: Color(0xFF880E4F),),
                          )
                  )
  
                  
                  
                ],
              ),
              ),

              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Create a new account! ',
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  )),


              /*Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,

                children: const <Widget>[

                  Text(

                    'Name:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign:TextAlign.justify,
                  ),

                ],
              ),*/

              Container(

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },


                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _bioContoller,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),

                    labelText: 'Enter Bio',
                    suffixIcon: Icon(Icons.girl_rounded,color: Color(0xFF880E4F),),

                      hintText: "",
                  ),



                ),

              ),



              Container(

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone number';
                    }
                    return null;
                  },
                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _phonenumberContoller,

                  decoration: const InputDecoration(

                      border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),
                      labelText: 'Enter Phone number',suffixIcon: Icon(Icons.phone,color: Color(0xFF880E4F),),


                  ),


                ),

              ),


              Container(

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _emailContoller,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),
                    labelText: 'Enter Email',suffixIcon: Icon(Icons.email_rounded,color: Color(0xFF880E4F),),

                    hintText: "eg:xyz@gamil.com",
                  ),
                ),
              ),
              Container(

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),

                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _usernameContoller,

                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),
                    labelText: 'Enter username',suffixIcon: Icon(Icons.supervised_user_circle_outlined,color: Color(0xFF880E4F),),



                  ),

                ),
              ),


              Container(

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),

                child:TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _genderContoller,
                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),
                    labelText: 'Enter your Gender',suffixIcon: Icon(Icons.girl_sharp,color: Color(0xFF880E4F),),


                  ),

                ),
              ),
              Container(

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:  TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _catagoriesnameContoller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),
                    labelText: 'Enter Category',


                  ),
                ),
              ),
              Container(

                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:  TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  obscureText:_isObscured,
                  style: TextStyle( color: Color(0xFF880E4F)),
                  controller: _passwordContoller,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF880E4F),),
                    ),
                    hintText: "password must be atleast 6 characters",
                    labelText: 'Enter password',
                    suffixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                      icon: _isObscured ? const Icon(Icons.visibility_outlined,color: Color(0xFF880E4F),):const Icon(Icons.visibility_off_outlined,color: Color(0xFF880E4F),),
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


              Container(
                  height: 70,

                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  color: Colors.pinkAccent[300],
                  child: ElevatedButton(

                    child: const Text('Sign Up',style: TextStyle(color: Colors.white), ),
                    onPressed: () async{
 String res = await AuthMethods().signUpUser(bio:_bioContoller.text,
     username: _usernameContoller.text, email: _emailContoller.text,
     gender: _genderContoller.text, phonenumber: _phonenumberContoller.text,
     password: _passwordContoller.text, catagoriesname: _catagoriesnameContoller.text,file:_image!
     );
 print(res);
 //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()),);

  },

                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF880E4F), // Background color
                      ),
                      )
                      ),
                      const Padding(
                      padding: EdgeInsets.all(15.0),
                      ),
                     
              Spacer(
                flex: 78,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              
              const Padding(
                padding: EdgeInsets.all(30.0),
              ),
              Column(
                children: [
                  Divider(
                    color: Colors.grey,
                  ),

                  TextButton(

                    child: const Text(
                      'Already have an account?Sign In',
                      style: TextStyle(fontSize: 15,color: Colors.black),
                    ),
                    onPressed: (

                        ) {Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()),);
                      //signup screen
                    },
                  ),


                ],
              ),


            ],
          )
      ),
],
   ),
      ),
    );

  }

}