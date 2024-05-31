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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: mediaqueryheight(0.02, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/name.jpeg',
            text: itemslists['packagename'],
            topname: 'PACKAGE NAME',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/desitionationnames.jpeg',
            text: itemslists['placenames'],
            topname: 'DESTINATION NAMES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/discription.jpeg',
            text: itemslists['packagediscription'],
            topname: 'PACKAGE DISCRIPTION',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Startdateandenddate(
                imagepath: 'assets/images/dates.jpeg',
                topname: 'STARTDATE',
                text: startDate,
              ),
              Startdateandenddate(
                imagepath: 'assets/images/dates.jpeg',
                topname: 'END DATE',
                text: endDate,
              ),
            ],
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Daysnightsrow(
                imagepath: 'assets/images/days.jpeg',
                text: itemslists['days'],
                topname: "DAYS",
              ),
              Daysnightsrow(
                imagepath: 'assets/images/nights.jpeg',
                text: itemslists['night'],
                topname: "NIGHTS",
              ),
            ],
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Daysnightsrow(
                imagepath: 'assets/images/couuntry.jpeg',
                text: itemslists['country'],
                topname: "COUNTRIES",
              ),
              Daysnightsrow(
                imagepath: 'assets/images/city.jpeg',
                text: itemslists['city'],
                topname: "CITIES",
              ),
            ],
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/transportation.jpeg',
            text: itemslists['transportation'],
            topname: 'TRANSPORTAION TYPES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/accomadation.jpeg',
            text: itemslists['accodamotion'],
            topname: 'ACCOMODATION',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/meals.jpeg',
            text: itemslists['meals'],
            topname: 'MEALS ',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/activity.jpeg',
            text: itemslists['activity'],
            topname: 'ACTIVITIES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/cash.jpeg',
            text: itemslists['adult'],
            topname: 'PER ADULT',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/cash3.jpeg',
            text: itemslists['hotelper'],
            topname: 'PER HOTEL NIGHT',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/cash2.jpeg',
            text: itemslists['childper'],
            topname: 'PER CHILD',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/packageamount.jpeg',
            text: itemslists['packageamount'],
            topname: 'PACKAGE AMOUNT',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/booking.jpeg',
            text: itemslists['booking'],
            topname: 'BOOKING INFORMATION & POLICIES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/additional.jpeg',
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
      ),
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
    return InkWell(
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
                fontFamily: sedan, fontSize: 20, color: whitecolor)),
      ),
    );
  }
}
