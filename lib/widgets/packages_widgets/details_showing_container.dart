import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';

import 'package:tripx_user_application/utils/mediaquery.dart';

class Daysnightsrow extends StatelessWidget {
  final String text;
  final String topname;
  final String imagepath; 

  const Daysnightsrow({
    super.key,
    required this.text,
    required this.topname,
    required this.imagepath, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: mediaquerywidht(0.4, context),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: orangecolor,
            width: mediaquerywidht(0.1, context),
            child: Image.asset(
              imagepath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopName(text: topname),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      text.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: colorteal,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Startdateandenddate extends StatelessWidget {
  final String text;
  final String topname;
  final String imagepath;
  const Startdateandenddate({
    super.key,
    required this.text,
    required this.topname,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: mediaquerywidht(0.4, context),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: orangecolor,
              width: mediaquerywidht(0.1, context),
              child: Image.asset(
                imagepath,
                fit: BoxFit.cover,
              )
              ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopName(text: topname),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    text.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: colorteal,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PackageDetailsContainers extends StatelessWidget {
  final String text;
  final String topname;
  final String imagepath;
  final bool isMoney;

  const PackageDetailsContainers({
    super.key,
    required this.text,
    required this.topname,
    required this.imagepath,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: mediaquerywidht(0.9, context),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: orangecolor,
              width: mediaquerywidht(0.15, context),
              child: Image.asset(
                imagepath,
                fit: BoxFit.cover,
              )),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopName(text: topname),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      (isMoney ? '₹' : '') + text.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 17,
                        color: colorteal,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
