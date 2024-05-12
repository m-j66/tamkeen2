/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../view/cartscreen.dart';
import '../view/profile.dart';
//import 'package:tamkeen2/view/profile.dart';


class CartItem {
  final String name;
  final String price;
  final String image;

  CartItem({required this.name, required this.price, required this.image});
}

class Post extends StatefulWidget {
  final snap;

  const Post({Key? key, required this.snap}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
 /* List<CartItem> cartItems = [];

  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void removeFromCart(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += double.parse(item.price);
    }
    return total;
  }*/

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pink),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.snap['profImage']),
                  ),
                ),
              ),
              title: Text(
                widget.snap['username'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(uid: widget.snap['uid']),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 400,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.snap['postUrl']),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 2),
            child: Row(
              children: [
                Text(
                  widget.snap['caption'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.pink[900]),
                      onPressed: () {},
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.pink[900]),
                  onPressed: () {
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cartscreen(
                          widget.uid;
                          cartItems: cartItems,
                          removeFromCart: removeFromCart,
                          getTotalPrice: getTotalPrice,
                        ),
                      ),
                    );*/
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tamkeen2/view/profile.dart';


class post extends StatelessWidget {
  final snap;

 const post({Key? key, required this.snap}):super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child:
                ListTile(
                  leading:Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(

                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.pink
                        ),
                        image: DecorationImage(
                           fit: BoxFit.cover,
                          image: NetworkImage(
                          snap['profImage']
                        ))
                    ),
                  ),
                  title: Text(
                    snap['username'], style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  onTap: (){
                  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                           uid: snap['uid'],
                        ),
                      ),);
                  },
                ),
              ),
              Container(
                height: 400,
                width:screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(
                          snap['postUrl'])
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 2),
                child: Row(
                  children: [
                    Text(snap['caption'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.favorite_border,color: Colors.pink[900]),
                          onPressed: () {  }
                          ,),
                      ],
                    ),
                    IconButton(icon: Icon(Icons.shopping_cart_outlined, color:Colors.pink[900]),
                      onPressed: () {  },)
                  ],),
              ),


            ],
          );
        }
}