import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/view/info.dart';
import 'package:ecommerce/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elkoshk Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoCondensedTextTheme(),

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Splash.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        nextScreen: Login(),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}

