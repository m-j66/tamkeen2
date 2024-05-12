import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tamkeen2/view/start.dart';


class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);


  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "تمکین",
      body: "Welcome to تمکین!",

          image: Image.asset("assets/images/logoo.png", height: 300.0,),

      ),


    PageViewModel(

      title: "About us",
      body:
      "تمکین is dedicated to creating a safe and inclusive community that values diversity and promotes creativity. We want to help women from all walks of life to unleash their potential and achieve success.",
      image: Image.asset("assets/images/logoo.png", height: 175.0),




    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
    child: Stack(
    children:[
      Container(
       
        child: IntroductionScreen(
          pages: listPagesViewModel,
          showSkipButton: true,
          skip: const Icon(Icons.skip_next, color: Color(0xFF880E4F)),
          next: const Text("Next", style: TextStyle(color: Color(0xFF880E4F))),
          done: const Text("Get Started", style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF880E4F))),

          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppScreen()),
            );
          },
          onSkip: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppScreen()),
            );
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: const Color(0xFF880E4F),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),

          globalBackgroundColor: Colors.brown.shade100
          ,


        ),

      ),

    ],
    ),
      ),
    );
  }
}