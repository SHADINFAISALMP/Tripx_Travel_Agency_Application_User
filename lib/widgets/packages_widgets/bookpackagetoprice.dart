import 'package:flutter/material.dart';
import 'package:tripx_user_application/models/traveller_model.dart';
import 'package:tripx_user_application/screens/package_details/package_persons_date.dart';
import 'package:tripx_user_application/screens/package_details/package_price.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/packages_widgets/no_of_rooms_childrens_adults.dart';

class Bookpackage extends StatefulWidget {
  const Bookpackage({
    super.key,
    required this.widget,
  });

  final PackagePerson widget;

  @override
  State<Bookpackage> createState() => _BookpackageState();
}

class _BookpackageState extends State<Bookpackage> {
  void navigateTopackageprice() {
    for (int i = 0; i < adultsCount; i++) {
      if (adultNameControllers[i].text.isEmpty ||
          adultAgeControllers[i].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter all adult details')),
        );
        return;
      }
    }
    for (int i = 0; i < childrenCount; i++) {
      if (childrenNameControllers[i].text.isEmpty ||
          childrenAgeControllers[i].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter all children details')),
        );
        return;
      }
    }
    List<Traveler> adults = [];
    for (int i = 0; i < adultsCount; i++) {
      adults.add(Traveler(
        name: adultNameControllers[i].text,
        age: int.parse(adultAgeControllers[i].text),
      ));
    }

    List<Traveler> children = [];
    for (int i = 0; i < childrenCount; i++) {
      children.add(Traveler(
        name: childrenNameControllers[i].text,
        age: int.parse(childrenAgeControllers[i].text),
      ));
    }

    Travelpackage travelPackage = Travelpackage(
      adultcount: adultsCount,
      childrencount: childrenCount,
      roomscount: roomsCount,
      adults: adults,
      children: children,
    );
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PackagePrice(
              itemslists: widget.widget.itemslists,
              adultsCount: adultsCount,
              childrenCount: childrenCount,
              roomsCount: roomsCount,
              travelpackage: travelPackage,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTopackageprice();
      },
      child: Center(
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
      ),
    );
  }
}
