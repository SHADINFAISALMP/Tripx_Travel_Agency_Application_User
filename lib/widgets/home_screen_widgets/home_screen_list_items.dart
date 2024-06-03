import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

// ignore: camel_case_types
class Homescreen_list_items extends StatelessWidget {
  const Homescreen_list_items({
    super.key,
    required this.context,
    required this.imagePath,
    required this.item,
  });

  final BuildContext context;
  final String imagePath;
  final QueryDocumentSnapshot<Object?> item;
  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackageDetails(
              itemslists: item,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorteal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tour, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  _checkNullOrEmpty(item['packagename']),
                  fontFamily: sedan,
                  fontSize: 25,
                  color: whitecolor,
                ),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.001, context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.place, color: whitecolor),
                  const SizedBox(width: 5),
                  mytext(_checkNullOrEmpty(item['placenames']),
                      fontFamily: sedan,
                      fontSize: 18,
                      color: whitecolor,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  mytext(_checkNullOrEmpty(item['packagediscription']),
                      fontFamily: sedan,
                      fontSize: 18,
                      color: whitecolor,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                const Icon(Icons.sunny, color: whitecolor),
                mytext(
                  _checkNullOrEmpty(item['days']),
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 20),
                const Icon(Icons.nights_stay, color: whitecolor),
                mytext(
                  _checkNullOrEmpty(item['night']),
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 20),
                const Icon(Icons.attach_money, color: whitecolor),
                mytext(
                  item['packageamount'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
