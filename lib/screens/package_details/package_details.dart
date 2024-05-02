import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class PackageDetails extends StatelessWidget {
  final List<String> images;

  const PackageDetails({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Bottomnavigation()));
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
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    final imagePath = images[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "KASHMIR PACKAGE",
                          topname: 'PACKAGE NAME',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "KASMIR , MANALI , ETC ",
                          topname: 'DESTINATION NAMES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Daysnightsrow(
                                text: "3",
                                topname: "DAYS",
                              ),
                              Daysnightsrow(
                                text: "4",
                                topname: "NIGHTS",
                              ),
                              Daysnightsrow(
                                text: "2",
                                topname: "COUNTRIES",
                              ),
                              Daysnightsrow(
                                text: "5",
                                topname: "CITIES",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "FLIGHT , BUS ",
                          topname: 'TRANSPORTAION TYPES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: " WE PROVING HOTEL",
                          topname: 'ACCOMODATION',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "BREAKFAST AND DINNER",
                          topname: 'MEALS ',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "JUMPING , HORSE RIDING",
                          topname: 'ACTIVITIES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "25000RS",
                          topname: 'PRICE DETAILS',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "INFORMATIONS",
                          topname: 'BOOKING INFORMATION & POLICIES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        const PackageDetailsContainers(
                          text: "ADITIONALSSS",
                          topname: 'ADDITIONAL INFORMATIONS',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.04, context),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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