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
  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  String _checkDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    if (!RegExp(r'\d{4}-\d{2}-\d{2}').hasMatch(value)) {
      return 'Not Available';
    }
    return value;
  }

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
            text: _checkNullOrEmpty(itemslists['packagename']),
            topname: 'PACKAGE NAME',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/desitionationnames.jpeg',
            text: _checkNullOrEmpty(itemslists['placenames']),
            topname: 'DESTINATION NAMES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/discription.jpeg',
            text: _checkNullOrEmpty(itemslists['packagediscription']),
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
                text: _checkDate(startDate),
              ),
              Startdateandenddate(
                imagepath: 'assets/images/dates.jpeg',
                topname: 'END DATE',
                text: _checkDate(endDate),
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
                text: _checkNullOrEmpty(itemslists['days']),
                topname: "DAYS",
              ),
              Daysnightsrow(
                imagepath: 'assets/images/nights.jpeg',
                text: _checkNullOrEmpty(itemslists['night']),
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
                text: _checkNullOrEmpty(itemslists['country']),
                topname: "COUNTRIES",
              ),
              Daysnightsrow(
                imagepath: 'assets/images/city.jpeg',
                text: _checkNullOrEmpty(itemslists['city']),
                topname: "CITIES",
              ),
            ],
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/transportation.jpeg',
            text: _checkNullOrEmpty(itemslists['transportation']),
            topname: 'TRANSPORTAION TYPES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/accomadation.jpeg',
            text: _checkNullOrEmpty(itemslists['accodamotion']),
            topname: 'ACCOMODATION',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/meals.jpeg',
            text: _checkNullOrEmpty(itemslists['meals']),
            topname: 'MEALS ',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/activity.jpeg',
            text: _checkNullOrEmpty(itemslists['activity']),
            topname: 'ACTIVITIES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/cash.jpeg',
            text: _checkNullOrEmpty(itemslists['adult']),
            topname: 'PER ADULT',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/cash3.jpeg',
            text: _checkNullOrEmpty(itemslists['hotelper']),
            topname: 'PER HOTEL NIGHT',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/cash2.jpeg',
            text: _checkNullOrEmpty(itemslists['childper']),
            topname: 'PER CHILD',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/packageamount.jpeg',
            text: _checkNullOrEmpty(itemslists['packageamount']),
            topname: 'PACKAGE AMOUNT',
            isMoney: true,
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/booking.jpeg',
            text: _checkNullOrEmpty(itemslists['booking']),
            topname: 'BOOKING INFORMATION & POLICIES',
          ),
          SizedBox(
            height: mediaqueryheight(0.01, context),
          ),
          PackageDetailsContainers(
            imagepath: 'assets/images/additional.jpeg',
            text: _checkNullOrEmpty(itemslists['additional']),
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
