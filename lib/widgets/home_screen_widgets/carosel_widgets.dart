import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/home_screen_load.dart';

class Carouselwidgets extends StatelessWidget {
  final CollectionReference packageDetails;
  const Carouselwidgets({super.key, required this.packageDetails});

  @override
  Widget  build(BuildContext context) {
    return StreamBuilder(
        stream: packageDetails.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Buildloadingindicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Nopackageavailable();
          } else {
            final querySnapshot = snapshot.data as QuerySnapshot;
            final packageCount = querySnapshot.docs.length;
            return CarouselSlider.builder(
                itemCount: packageCount,
                itemBuilder: (context, index, realindex) {
                  final items = snapshot.data!.docs[index];
                  List<String> imagess =
                      (items['imagepath'] as List<dynamic>).cast<String>();
                  return buildImage(imagess.first, index, items,context);
                },
                options: CarouselOptions(
                    viewportFraction: 0.72,
                    enlargeCenterPage: true,
                    height: mediaqueryheight(0.45, context),
                    autoPlayCurve: Curves.linear,
                    onPageChanged: (index, reason) => null,
                    autoPlay: true));
          }
        });
  }
 Widget buildImage(String image, int index, QueryDocumentSnapshot<Object?> items,BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PackageDetails(
                    itemslists: items,
                  )),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: colorteal,
        ),
        width: mediaquerywidht(0.75, context),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                image,
                height: 300,
                width: mediaquerywidht(0.75, context),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                locationName(index, items,context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget locationName(int index, item,BuildContext context) {
    return mytext(item['packagename'],
        fontFamily: sedan,
        fontSize: mediaqueryheight(0.027, context),
        color: whitecolor);
  }
}
