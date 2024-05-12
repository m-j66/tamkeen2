import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class check_out extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Checkout",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:Colors.pink[900],
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
      SingleChildScrollView(
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Container(
            margin:EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print("ciao"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),

                          Padding(padding: EdgeInsets.all(6),
                            child:

                            Text("Address", style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ]
                    ),
                    Container(
                      height: 40,

                      child:TextField(
                          decoration:InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "House no ,Street no ,City"
                          )
                      ),
                    ),

                    Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),

                          Padding(padding: EdgeInsets.all(6),
                            child:
                            Text("Phone No", style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ]
                    ),
                    Container(
                      height: 40,

                      child:TextField(
                          decoration:InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "0123456789"
                          )
                      ),
                    ),
                    Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),

                          Padding(padding: EdgeInsets.all(6),
                            child:
                            Text("Email ", style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ]
                    ),
                    Container(
                      height: 40,

                      child:TextField(
                          decoration:InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "abc@gmail.com"
                          )
                      ),
                    ),
                    Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),

                          Padding(padding: EdgeInsets.all(6),
                            child:
                            Text("City Code", style: TextStyle(fontWeight: FontWeight.bold) ,),
                          )
                        ]
                    ),
                    Container(
                      height: 40,

                      child:TextField(
                          decoration:InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "**"
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child:TextField(
                          decoration:InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "+  Add delivery instruction "
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            margin:EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print("ciao"),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          children: [

                            Icon(
                              Icons.payment,
                              //color: Colors.pinkAccent,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Padding(padding: EdgeInsets.all(6),
                              child:
                              Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ]
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      Row(
                          children: [
                            Icon(
                              Icons.delivery_dining,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Padding(padding: EdgeInsets.all(6),
                              child:
                              Text("Cash",),
                            ),
                          ]
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]
                ),
              ),
            ),
          ),
          Center(
              child: SizedBox(
                width: 300,
                height: 50,
            child: ElevatedButton(
              child: Text("Place Order",
                style:TextStyle(fontSize: 20,color:Colors.white),

              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[900],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/img_1.png",
                                  height: 250,
                                  width: 200,
                                ),
                              ),
                              Text("You're welcome!we are glad I could help. Feel free to reach out"
                              " whenever you have more questions or need assistance. ",style:TextStyle(fontSize: 12),),
                              Text("we are here to serve you. Have a great day!",style:TextStyle(fontSize: 12),),

                            ],
                          ),
                        ),
                      ),
                      actions: [
                        Center(
                    child: SizedBox(
                    width: 100,
                      height: 35,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style:TextStyle(fontSize: 20,color:Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary:Colors.pink[900],
                            ),
                            onPressed: () {
                              // your code
                            },
                          ),
                        ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          ),

        ]),
      ),
    );
  }
}