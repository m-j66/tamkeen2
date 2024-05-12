import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:tamkeen2/view/addNew.dart';
import 'package:tamkeen2/view/cart.dart';
import 'package:tamkeen2/view/openpic.dart';
import '../Widgets/posts.dart';


class ProfileScreen extends StatefulWidget
{
  final String uid;
  const ProfileScreen({Key? key, required this.uid}) : super(key: key);


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  var users= {};
  bool isLoading = false;
  int _currentIndex=3;

   
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    setState(() {
      isLoading = true;
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
      isLoading = false;
    });
  }
  Widget build(BuildContext context)
  {
    void onTabTapped(int index)
{
  if (index==2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddNew(uid: widget.uid,)
        )
      );
  }
  else if (index==0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(uid: widget.uid,)
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
    
    
       if (isLoading) {
     return const Center(
    child: CircularProgressIndicator(),
  );
   } else {
     return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title: const Text("تمکین", style: TextStyle(color: Colors.white70),),

          
      ),



      body:
      ListView(
        children: [
          Column(
              
            children: [

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Center(

                        child:
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage('assets/images/prof.png'),
                          radius: 80,

                        )
                    )
                  ]
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,

                children: [ Text( users['username'],textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  ),
                 
                ],
                
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: null,
                child: Text(users['bio']),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 6.0, bottom: 20.0),
              ),
              const Divider(),
    FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: widget.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
          if(snapshot.hasData){
        return GridView.builder(
          shrinkWrap: true,
          itemCount: (snapshot.data! as dynamic).docs.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 1.5,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            DocumentSnapshot snap =
            (snapshot.data! as dynamic).docs[index];

            return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenPic(imageUrl: snap['postUrl'], userName: snap['username'],)),
            );
          },
          child: Container(
            height: 40,
           // width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(snap['postUrl']),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
            
            /* Container(
              child: Image(
                image: NetworkImage(snap['postUrl']),
                fit: BoxFit.cover,
                
              ),
            );*/
          },
        );
          }
          else{

            return Row(children: [Text("No Posts Yet")],);
          }
      },
    )

///////////////////////////////////////////////
            ],
          ),
        ],
      ),



      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(254, 248, 235, 245),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
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



 /* Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/
}