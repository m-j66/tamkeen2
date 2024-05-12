import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String price;
  final String image;

  CartItem({required this.id, required this.name, required this.price, required this.image});
}

class OpenPic extends StatefulWidget {
  final String imageUrl;
  final String userName;

  const OpenPic({Key? key, required this.imageUrl, required this.userName}) : super(key: key);

  @override
  State<OpenPic> createState() => _OpenPicState();
}

class _OpenPicState extends State<OpenPic> {
  int _likeCount = 0;

  void _likeButtonPressed() {
    setState(() {
      _likeCount++;
    });
  }

  void _addToCart() {
    CartItem item = CartItem(
      id: widget.imageUrl,
      name: widget.userName,
      price: '0',
      image: widget.imageUrl,
    );

    // Add the item to the cart
    // You can implement your own logic here
    // For example, you can use a state management solution like Provider or Riverpod
    addToCart(item);
  }

  void addToCart(CartItem item) {
    // Add the item to the cart
    // You can implement your own logic here
    // For example, you can use a state management solution like Provider or Riverpod
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        backgroundColor: Colors.pink[900],
        title: const Text('Posts'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 80, 0, 20),
                    ),
                    CircleAvatar(
                      backgroundImage: const AssetImage("assets/images/prof.png"),
                      radius: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 30.0),
                    ),
                    TextButton(
                      child: const Text(
                        'user_name',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  height: 450.0,
                  width: double.infinity,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(bottom: 16.0)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.pink,
                      onPressed: _likeButtonPressed,
                    ),
                    Padding(padding: const EdgeInsets.all(12.0)),
                    Text('$_likeCount likes'),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      color: Colors.pink,
                      onPressed: _addToCart,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}