import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamkeen2/models/userdata.dart';
import '../res/components/colors.dart';
import '../res/components/loading.dart';
import '../res/databaseService.dart';

class ChangePersonalInfo extends StatefulWidget
{
  String uid;
   ChangePersonalInfo({super.key, required this.uid});

  @override
  State<ChangePersonalInfo> createState() => _ChangePersonalInfo();
}

class _ChangePersonalInfo extends State<ChangePersonalInfo> {
    String? _currentPassword;
    String? _currentemail;
    String? _currentPhone;
    String? _currentCat;
    String? _currentUserName;
    String? _currrentfullName;
   // DocumentSnapshot snapshot = await collection.doc('users').get();

  @override
  var _isObscured;
  void initState()
  {
    super.initState();
    _isObscured = true;
  }
  Widget build(BuildContext context) {
     //User1 user = Provider.of<User1>(context);
      return StreamBuilder<User1>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User1? userData = snapshot.data;
          return 
    Scaffold(
      appBar: AppBar(title: Text("Edit Personal Information",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: AppColors.pinkColor,
        leading: GestureDetector(
            onTap: (){},
            child: IconButton(
              icon:Icon(
                Icons.arrow_back,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              color: Colors.white,
            )
        ),
      ),

      body:
      ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(25),
          children:<Widget>[
         /*   Column(
                children:[
                  Padding(padding:EdgeInsets.only(left: 40),
                      child:
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
                ]),
            Column(
                children:[
                  Padding(padding:EdgeInsets.only(left: 40, top: 10),
                      child: TextButton(
                          onPressed: (){}, child: Text("Change Picture", style: TextStyle(color: Colors.white),),
                          style: TextButton.styleFrom(backgroundColor: AppColors.pinkColor)
                      )
                  ),
                ] ),*/
            Row(
                children: [Padding(padding: EdgeInsets.all(8),
                  child:
                  Text("Name", style: TextStyle(fontWeight: FontWeight.bold),),
                )
                ]
            ),
            Container(
              height: 40,
              child:TextFormField(
                  decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      
                      hintText: userData!.usernamee,
                      
                  ),
                  validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentUserName = val),
              ),
            ),

            Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                    child:
                    Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ]
            ),
            Container(
              height: 40,
              child:TextFormField(
                  decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: userData.phonenumber,
                  ),
                  validator: (val) => val!.isEmpty ? 'Please enter phoneNumber' : null,
                  onChanged: (val) => setState(() => _currentPhone = val),
              ),
            ),

            Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                    child:
                    Text("Email", style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ]
            ),
            Container(
              height: 40,
              child:TextFormField(
                  decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: userData.email
                  ),
                  validator: (val) => val!.isEmpty ? 'Please enter email' : null,
                  onChanged: (val) => setState(() => _currentemail = val),
              ),
            ),

            Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                    child:
                    Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold),),
                  )]),
            Container(
              height: 40,
              child:TextFormField(
                  decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: userData.bio
                  ),
                   validator: (val) => val!.isEmpty ? 'Please enter a bio' : null,
                  onChanged: (val) => setState(() => _currrentfullName = val),
              ),
            ),

            Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                    child:
                    Text("Password", style: TextStyle(fontWeight: FontWeight.bold),),
                  )]
            ),
            Container(
              height: 40,
              child:TextFormField(
                decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: userData.password,
                    suffixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                      icon: _isObscured ? const Icon(Icons.visibility,color: Color(0xFF880E4F),):const Icon(Icons.visibility_off_outlined,color: Color(0xFF880E4F),),
                      onPressed: ()
                      {
                        setState(() {
                          _isObscured =!_isObscured;
                        });
                      },


                    ),

                ),
                 validator: (val) => val!.isEmpty ? 'Please enter a password' : null,
                  onChanged: (val) => setState(() => _currentPassword = val),
              ),
            ),

            Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                    child:
                    Text("Category", style: TextStyle(fontWeight: FontWeight.bold),),
                  )]
            ),
            Container(
              height: 40,
              child:TextFormField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.blueGrey,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: userData.category
                ),
                validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentCat = val),

              ),
            ),
            Padding(padding: EdgeInsets.all(8),
              child:  TextButton( child:
              Text("Save Changes", style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(backgroundColor: AppColors.pinkColor,),
                  onPressed: () async {
                      await DatabaseService(uid: widget.uid).updateUserData(
                        _currentUserName ?? snapshot.data!.usernamee,  
                        _currentemail ?? snapshot.data!.email,
                        _currentPassword ?? snapshot.data!.password, 
                        _currentPhone ?? snapshot.data!.phonenumber,
                        _currrentfullName ?? snapshot.data!.bio,
                        _currentCat ?? snapshot.data!.category
                      );
                      Navigator.pop(context);
                    }
              ),
            )

          ]
      )
      ,

    );
  } else {
          return Loading();
  }}
  );
  }}