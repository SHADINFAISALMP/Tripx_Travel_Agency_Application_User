import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/packages_widgets/details_showing_contents.dart';

class PackageDetails extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> itemslists;

  const PackageDetails({Key? key, required this.itemslists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String startDate = itemslists['startdate'];
    String endDate = itemslists['enddate'];
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Bottomnavigation()));
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text("PACKAGE DETAILS"),
        titleTextStyle: const TextStyle(color: whitecolor, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: whitecolor,
                ),
                child: CarouselSlider.builder(
                  itemCount: itemslists['imagepath'].length,
                  itemBuilder: (context, index, realIndex) {
                    List<String> imagess =
                        (itemslists['imagepath'] as List<dynamic>)
                            .cast<String>();
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imagess[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.4,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: colorteal,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: mediaqueryheight(0.5747, context),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Detailsshowingcontents(
                      itemslists: itemslists,
                      startDate: startDate,
                      endDate: endDate),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
