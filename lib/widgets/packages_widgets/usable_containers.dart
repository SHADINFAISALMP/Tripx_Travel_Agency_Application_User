import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class UsableContainer extends StatelessWidget {
  final String text;
  final String text2;

  const UsableContainer({
    super.key,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.07, context),
      width: mediaquerywidht(0.9, context),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        color: whitecolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(color: colorteal),
          ),
          Text(
            text2,
            style: const TextStyle(color: colorteal),
          ),
        ],
      ),
    );
  }
}
class Appbarcontainer extends StatelessWidget {
  const Appbarcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: whitecolor,
      ),
      child: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: colorteal,
        ),
        centerTitle: true,
        title: mytext(
          'ADD PERSON',
          fontFamily: bodoni,
          fontSize: 25,
          color: colorteal,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.arrow_back_ios,
        color: colorteal,
      ),
      centerTitle: true,
      title: mytext(
        'PRICE SUMMARY',
        fontFamily: bodoni,
        fontSize: 25,
        color: colorteal,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
