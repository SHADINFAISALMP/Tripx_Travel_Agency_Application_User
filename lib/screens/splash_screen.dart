import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/boarding_1.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Boardingone()));
    });
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/splash.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: mediaqueryheight(.9, context),
              left: mediaquerywidht(.35, context),
              child: mytext(
                "TRIPX",
                color: splashcolor,
                fontSize: mediaqueryheight(.04, context),
                fontWeight: FontWeight.bold,
                fontFamily: sedan,
              ))
        ],
      ),
    );
  }
}
