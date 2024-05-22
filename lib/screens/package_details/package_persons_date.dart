import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/models/traveller_model.dart';
import 'package:tripx_user_application/screens/package_details/package_price.dart';
import 'package:tripx_user_application/screens/package_details/widgets.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class PackagePerson extends StatefulWidget {
  const PackagePerson({Key? key}) : super(key: key);

  @override
  _PackagePersonState createState() => _PackagePersonState();
}

class _PackagePersonState extends State<PackagePerson> {

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < adultsCount; i++) {
      adultNameControllers.add(TextEditingController());
      adultAgeControllers.add(TextEditingController());
    }
    for (int i = 0; i < childrenCount; i++) {
      childrenNameControllers.add(TextEditingController());
      childrenAgeControllers.add(TextEditingController());
    }
  }
  void _submitDetails() {
    for (int i = 0; i < adultsCount; i++) {
      if (adultNameControllers[i].text.isEmpty ||
          adultAgeControllers[i].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter all adult details')),
        );
        return;
      }
    }
    for (int i = 0; i < childrenCount; i++) {
      if (childrenNameControllers[i].text.isEmpty ||
          childrenAgeControllers[i].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter all children details')),
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

    BlocProvider.of<PackageBloc>(context)
        .add(SubmitTravelPackage(travelPackage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: appbarcontainer(),
      ),
      body: BlocConsumer<PackageBloc, PackageState>(listener: (context, state) {
        if (state is Packagesucess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Travel package saved successfully!')),
          );
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PackagePrice()));
        } else if (state is Packageerror) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save travel package!')),
          );
        }
      }, builder: (context, state) {
        if (state is PackageLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PackageUpdated) {
          while (adultNameControllers.length < state.adultsCount) {
            adultNameControllers.add(TextEditingController());
            adultAgeControllers.add(TextEditingController());
          }
          while (adultNameControllers.length > state.adultsCount) {
            adultNameControllers.removeLast();
            adultAgeControllers.removeLast();
          }

          while (childrenNameControllers.length < state.childrenCount) {
            childrenNameControllers.add(TextEditingController());
            childrenAgeControllers.add(TextEditingController());
          }
          while (childrenNameControllers.length > state.childrenCount) {
            childrenNameControllers.removeLast();
            childrenAgeControllers.removeLast();
          }

          adultsController.text = state.adultsCount.toString();
          childrenController.text = state.childrenCount.toString();
          roomsController.text = state.roomsCount.toString();
          adultsCount = state.adultsCount;
          childrenCount = state.childrenCount;
          roomsCount = state.roomsCount;
        }
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Numberofadults(),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  const Numberofchildrens(),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  const Numberofrooms(),
                  const SizedBox(height: 20),
                  ...buildAdultFields(),
                  const SizedBox(height: 20),
                  ...buildchildrenFields(),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _submitDetails();
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
                                fontFamily: sedan,
                                fontSize: 20,
                                color: whitecolor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

