import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/screens/package_details/package_persons_date.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

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
                        PackageDetailsContainers(
                          text: itemslists['packagename'],
                          topname: 'PACKAGE NAME',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['placenames'],
                          topname: 'DESTINATION NAMES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Startdateandenddate(
                                topname: 'START DATE',
                                text: startDate,
                              ),
                              Startdateandenddate(
                                topname: 'END DATE',
                                text: endDate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Daysnightsrow(
                                text: itemslists['days'],
                                topname: "DAYS",
                              ),
                              Daysnightsrow(
                                text: itemslists['night'],
                                topname: "NIGHTS",
                              ),
                              Daysnightsrow(
                                text: itemslists['country'],
                                topname: "COUNTRIES",
                              ),
                              Daysnightsrow(
                                text: itemslists['city'],
                                topname: "CITIES",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['transportation'],
                          topname: 'TRANSPORTAION TYPES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['accodamotion'],
                          topname: 'ACCOMODATION',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['meals'],
                          topname: 'MEALS ',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['activity'],
                          topname: 'ACTIVITIES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['adult'],
                          topname: 'PER ADULT',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['hotelper'],
                          topname: 'PER HOTEL NIGHT',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['childper'],
                          topname: 'PER CHILD',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['packageamount'],
                          topname: 'PACKAGE AMOUNT',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['booking'],
                          topname: 'BOOKING INFORMATION & POLICIES',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        PackageDetailsContainers(
                          text: itemslists['additional'],
                          topname: 'ADDITIONAL INFORMATIONS',
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PackagePerson(
                                        itemslists: itemslists,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: orangecolor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: blackcolor,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(1, 3),
                                  ),
                                ],
                              ),
                              height: mediaqueryheight(0.05, context),
                              width: mediaquerywidht(0.6, context),
                              child: Center(
                                  child: mytext("BOOK PACKAGE",
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: whitecolor)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
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
