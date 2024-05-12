import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tamkeen2/res/components/firestore_methods.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:tamkeen2/view/cart.dart';
import 'dart:core';

import 'package:tamkeen2/view/profile.dart';


class AddNew extends StatefulWidget
{
  final String uid;
  const AddNew({super.key, required this.uid});

  @override
  State <AddNew> createState()=> _AddNew();
}

Future<Uint8List?> _pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  print("No Image Selected");
  return null;
}

/* _pickImage(ImageSource source) async {
   final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();}
      print("No Image Selected");

   /* String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {
      print(error);
    }*/
  }*/
class _AddNew extends State<AddNew>
{
 

  @override
  Widget build(BuildContext context)
  {int _currentIndex=2;

  void onTabTapped(int index)
{
  
  if (index==0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(uid: widget.uid)
        )
      );}
  else if (index==3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen(uid: widget.uid,)
        )
      );


  }
   else if (index==1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cart(uid: widget.uid,)
        )
      );
}
}
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title: Text('تمکین'),
        ),
        body: MyCustomForm(widget.uid),

        bottomNavigationBar: BottomNavigationBar(
           // currentIndex: _currentIndex,
            backgroundColor: Color.fromARGB(254, 248, 235, 245),
            selectedItemColor: Colors.pink,
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

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  final String uid;
  MyCustomForm(this.uid);
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  //TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerCategory = TextEditingController();
  TextEditingController _controllerCaption = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
 /* CollectionReference _reference =
  FirebaseFirestore.instance.collection('database');
 */ final _formKey = GlobalKey<FormState>();

  String imageUrl = '';

  Uint8List? _image;
  Future<void> selectImage(ImageSource source) async {
  Uint8List? image = await _pickImage(source);
  if (image != null) {
    print('Image selected: $image');
    setState(() {
      _image = image;
    });
  }
}

  
  /*
  Future<void> selectImage(ImageSource source) async {

Uint8List? im= await _pickImage(source);
      setState(() {
       _image=im; 
      });
  }
*/
  Future<void> _showImageSourceDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Select from Gallery'),
                  onTap: () {
                    selectImage(ImageSource.gallery);
                    Navigator.pop(context);
                    //_pickImage(ImageSource.gallery);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text('Take a Photo'),
                  onTap: () {                 
                  selectImage(ImageSource.camera);
                  Navigator.pop(context);
                  //  _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void postImage(
    String uid,
    String username, String profImage)
    async
        {
          try{
         String res= await FireStoreMethods().uploadPost(_controllerCaption.text, _image!, uid, username,profImage);
          }
            catch(e){
                      }

  }
   var users= {};

    void initState() {
    super.initState();
    getData();
  }
  
    getData() async {
    setState(() {
      
    });

    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
          print(widget.uid);
      users = userSnap.data()!;
      print(users['username']);
      print(users['bio']);

      setState(() {});
    } catch (e) {
    /*  showSnackBar(
        context,

        e.toString(),
      );*/
    }
    setState(() {
     
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
    ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(

                padding: const EdgeInsets.all(20),
                child:  TextFormField(

                   controller: _controllerCategory,
                  style: TextStyle( color: Color(0xFF880E4F)),
                  decoration: InputDecoration(
                    // hintText: ,
                    border: OutlineInputBorder(),

                    labelText: 'Add name of your product ',prefixIcon:Icon(Icons.note_alt, color: Color(0xFF880E4F)),
                  

                  ),

                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),

              Container(

                padding: const EdgeInsets.all(20),
                child:  TextFormField(
                controller: _controllerCaption,

                  style: TextStyle( color: Color(0xFF880E4F)),
                  decoration: InputDecoration(
                    // hintText: ,
                    border: OutlineInputBorder(),

                    labelText: 'Add Caption',prefixIcon:Icon(Icons.note_alt, color: Color(0xFF880E4F)),


                  ),

                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),



           /*   const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),*/


              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              ),
               Center(
                child:  _image != null
          ? Image.memory(
              _image!,
              width: 350,
              height: 350,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/default.png',
              fit: BoxFit.cover,
              width: 350,
              height: 350,

            ),


                /*Container(
                 decoration: BoxDecoration(
                  image: 
                  _image!= null? DecorationImage(
                                 fit: BoxFit.cover,
                    image :  MemoryImage(_image!)
                  ) : const DecorationImage(image: AssetImage('assets/images/prof.png'))
                 ),

                ),*/
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add picture of your product',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: _showImageSourceDialog,
                    ),
                  ],
                ),
              ),

              

              Padding(padding: EdgeInsets.only(top: 50)),

              Center(
                child: ElevatedButton(
                  onPressed:()=> postImage(widget.uid,users['username'],'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'),
                
               
                  


                  /*if(imageUrl.isEmpty)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please upload an image')));
                      return;
                    }*/
                  /*if(key.currentState!.validate())
                  {
                    String prodName=_controllerName.text;
                    String prodCaption=_controllerCaption.text;

                    Map<String,String> dataToSend={
                      'name': prodName,
                      'caption' : prodCaption,
                      'image' : imageUrl,
                    };

                    await _reference.add(dataToSend);
                  /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen(imageUrl: imageUrl)),
                  );*/
                  }*/
                  
        
         child: Text('Post' ),
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        side: BorderSide(width:3, color:Colors.brown), //border width and color
        elevation: 3, //elevation of button
        shape: RoundedRectangleBorder( //to set border radius to button
        borderRadius: BorderRadius.circular(30),
        ),),
   
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),

              /* Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()),
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            side: BorderSide(width:3, color:Colors.brown), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(30),
                            ),),
                          child: const Text(
                            "Post",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))),*/

              const SizedBox(width: 100),
            ],
          ),


        ),
      
      ],

    );

  }
}