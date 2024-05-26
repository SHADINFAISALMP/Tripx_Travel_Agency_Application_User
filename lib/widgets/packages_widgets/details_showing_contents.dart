import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/package_details/package_persons_date.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/packages_widgets/details_showing_container.dart';

class Detailsshowingcontents extends StatelessWidget {
  const Detailsshowingcontents({
    super.key,
    required this.itemslists,
    required this.startDate,
    required this.endDate,
  });

  final QueryDocumentSnapshot<Object?> itemslists;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        BookPackagebutton(itemslists: itemslists),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
      ],
    );
  }
}
class BookPackagebutton extends StatelessWidget {
  const BookPackagebutton({
    super.key,
    required this.itemslists,
  });

  final QueryDocumentSnapshot<Object?> itemslists;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

