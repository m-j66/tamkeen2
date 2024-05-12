import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tamkeen2/Widgets/Post.dart';


class stream extends StatelessWidget {
  @override
Widget build(BuildContext context) {
 double Height = MediaQuery.of(context).size.height;
   return  StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if(snapshot.connectionState== ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }    
            return Expanded(
              child: Container(
              height: Height,
              child:
              ListView.builder(
              //itemCount: post.length2,  
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index)=>  
              Container(
                child: post(
              snap: snapshot.data!.docs[index].data(),
            ),))
            )
            );      
            },
            );
  }
  }