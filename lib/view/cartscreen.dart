//import 'dart:js';

/*import 'package:flutter/material.dart';
import 'package:tamkeen2/view/Home.dart';
import 'package:tamkeen2/view/addNew.dart';
import 'package:tamkeen2/view/profile.dart';

import '../Widgets/Post.dart';
import '../res/components/colors.dart';

class Cartscreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(CartItem) removeFromCart;
  final double Function() getTotalPrice;
  final String uid;
  Cartscreen({
    Key? key,
    required this.cartItems,
    required this.removeFromCart,
    required this.getTotalPrice,
    required this.uid,
  }) : super(key: key);

  @override
  int _currentIndex=2;
  
  Widget build(BuildContext context) {
     void onTabTapped(int index)
{
  if (index==3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddNew(uid: uid,)
        )
      );
  }
  else if (index==4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen(uid: uid,)
        )
      );
      
}
      
  else if (index==0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(uid: uid,)
        )
      );
  }
}
    // Implement your cart screen UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          CartItem item = cartItems[index];
          return ListTile(
            leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.price),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                removeFromCart(item);
              },
            ),
          );
        },
      ),
  /*    bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total Price: \$${getTotalPrice()}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),*/

      bottomNavigationBar: BottomNavigationBar(
           // currentIndex: _currentIndex,
            backgroundColor: Color.fromARGB(254, 248, 235, 245),
            selectedItemColor: AppColors.pinkColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
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
}*/