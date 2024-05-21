import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';

class appbarcontainer extends StatelessWidget {
  const appbarcontainer({
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
