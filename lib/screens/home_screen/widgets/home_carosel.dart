import 'package:flutter/material.dart';



int activeindex = 0;


//  Widget buildindicator() => AnimatedSmoothIndicator(
//      effect: const ExpandingDotsEffect(
//          activeDotColor: colorteal, dotWidth: 15, dotHeight: 5),
//      activeIndex: activeindex,
     
//      count: );

Widget buildimage(String imagess, int index) => SizedBox(
      height: 300,
      width: 300,
      child: Image.asset(
        imagess,
        fit: BoxFit.cover,
      ),
    );

class Carosel extends StatefulWidget {
  const Carosel({super.key});

  @override
  State<Carosel> createState() => _CaroselState();
}

class _CaroselState extends State<Carosel> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
