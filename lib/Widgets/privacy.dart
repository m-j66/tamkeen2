import 'package:flutter/material.dart';
class privacy extends StatefulWidget
{
  const privacy({super.key});

  @override
  State<privacy> createState() => _privacy();
}

class _privacy extends State<privacy> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor:Colors.pink[900],
      title: Text("Privacy Policy"),
    ),
    body: Column(children: [
       Text("The information we collect and process depends on how you use tamkeen.Some information is required for our Products to work.Other information is optional, but without it, the quality of your experience might be affected.",style: TextStyle(fontSize: 16)),
      
    ]),
    );
    
    }
}