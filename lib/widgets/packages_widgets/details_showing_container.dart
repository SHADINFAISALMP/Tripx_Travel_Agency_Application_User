import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Daysnightsrow extends StatelessWidget {
  final String text;
  final String topname;
  const Daysnightsrow({
    super.key,
    required this.text,
    required this.topname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopName(text: topname),
        Container(
          width: mediaquerywidht(0.18, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child:
                mytext(text, fontFamily: sedan, fontSize: 17, color: colorteal),
          ),
        )
      ],
    );
  }
}

class Startdateandenddate extends StatelessWidget {
  final String text;
  final String topname;
  const Startdateandenddate({
    super.key,
    required this.text,
    required this.topname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopName(text: topname),
        Container(
          width: mediaquerywidht(0.38, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child:
                mytext(text, fontFamily: sedan, fontSize: 17, color: colorteal),
          ),
        )
      ],
    );
  }
}

class PackageDetailsContainers extends StatelessWidget {
  final String text;
  final String topname;
  const PackageDetailsContainers({
    super.key,
    required this.text,
    required this.topname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopName(text: topname),
        Container(
          width: mediaquerywidht(0.84, context),
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: blackcolor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                mytext(text, fontFamily: sedan, fontSize: 17, color: colorteal),
          ),
        ),
      ],
    );
  }
}

class TopName extends StatelessWidget {
  final String text;
  const TopName({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Text(
        text,
        style: const TextStyle(color: whitecolor),
        textAlign: TextAlign.start,
      ),
    );
  }
}
