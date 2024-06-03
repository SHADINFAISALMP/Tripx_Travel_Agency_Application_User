import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({super.key});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: colorteal,
            ),
          ),
          backgroundColor: whitecolor,
          centerTitle: true,
          title: mytext("HOLIDAYS PACKAGES",
              fontFamily: bodoni,
              fontSize: 22,
              color: colorteal,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorteal,
        body: SafeArea(
          child: buildListView(),
        ));
  }

  Widget buildListView() {
    final CollectionReference packageDetails =
        FirebaseFirestore.instance.collection('packagedetails');
    return StreamBuilder(
        stream: packageDetails.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: whitecolor, size: 60),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Packages available'),
            );
          }
          final querySnapshot = snapshot.data!;
          return ListView.builder(
              itemCount: querySnapshot.size,
              itemBuilder: (context, index) {
                final item = querySnapshot.docs[index];
                List<String> images =
                    (item['imagepath'] as List<dynamic>).cast<String>();
                return buildListItem(context, images.first, item);
              });
        });
  }

  Widget buildListItem(BuildContext context, String imagepath,
      QueryDocumentSnapshot<Object?> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackageDetails(itemslists: item),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: whitecolor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagepath,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tour, color: black54),
                const SizedBox(width: 5),
                mytext(
                  _checkNullOrEmpty(item['packagename']),
                  fontFamily: sedan,
                  fontSize: 25,
                  color: colorteal,
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
                  const Icon(Icons.place, color: black54),
                  const SizedBox(width: 5),
                  mytext(_checkNullOrEmpty(item['placenames']),
                      fontFamily: sedan,
                      fontSize: 18,
                      color: colorteal,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  mytext(_checkNullOrEmpty(item['packagediscription']),
                      fontFamily: sedan,
                      fontSize: 18,
                      color: colorteal,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 30),
                const Icon(Icons.sunny, color: black54),
                mytext(
                  _checkNullOrEmpty(item['days']),
                  fontFamily: sedan,
                  fontSize: 18,
                  color: colorteal,
                ),
                const SizedBox(width: 30),
                const Icon(Icons.nights_stay, color: black54),
                mytext(
                  _checkNullOrEmpty(item['night']),
                  fontFamily: sedan,
                  fontSize: 18,
                  color: colorteal,
                ),
                const SizedBox(width: 20),
                const Icon(Icons.attach_money, color: black54),
                mytext(
                  item['packageamount'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: colorteal,
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
