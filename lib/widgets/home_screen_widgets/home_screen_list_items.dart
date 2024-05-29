import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class homescreen_list_items extends StatelessWidget {
  const homescreen_list_items({
    super.key,
    required this.context,
    required this.imagePath,
    required this.item,
  });

  final BuildContext context;
  final String imagePath;
  final QueryDocumentSnapshot<Object?> item;

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
        height: mediaqueryheight(0.52, context),
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
                  item['packagename'],
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
                  mytext(item['placenames'],
                      fontFamily: sedan,
                      fontSize: 18,
                      color: whitecolor,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  mytext(item['packagediscription'],
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
                const SizedBox(width: 35),
                const Icon(Icons.sunny, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['days'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 55),
                const Icon(Icons.nights_stay, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['night'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 35),
                const Icon(Icons.attach_money, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['packageamount'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
