
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tamkeen2/view/getting_started.dart';
import 'package:tamkeen2/view/signin.dart';


class insherah_splash extends StatelessWidget {
  const insherah_splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: Colors.blueGrey.shade300,
        splashIconSize: 1000,
        duration: 5000,
        splash: LottieBuilder(
            lottie: NetworkLottie("https://assets9.lottiefiles.com/packages/lf20_vGhJkn.json")),
        nextScreen: IntroductionPage()
        );

  }
}