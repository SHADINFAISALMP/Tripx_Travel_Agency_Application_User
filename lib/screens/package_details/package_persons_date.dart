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
  TextEditingController adultsController = TextEditingController(text: '1');
  TextEditingController childrenController = TextEditingController();
  TextEditingController roomsController = TextEditingController(text: '1');
  int adultsCount = 1;
  int childrenCount = 0;
  int roomsCount = 1;
  List<TextEditingController> adultNameControllers = [];
  List<TextEditingController> adultAgeControllers = [];
  List<TextEditingController> childrenNameControllers = [];
  List<TextEditingController> childrenAgeControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers for adults and children
    for (int i = 0; i < adultsCount; i++) {
      adultNameControllers.add(TextEditingController());
      adultAgeControllers.add(TextEditingController());
    }
    for (int i = 0; i < childrenCount; i++) {
      childrenNameControllers.add(TextEditingController());
      childrenAgeControllers.add(TextEditingController());
    }
  }

  List<Widget> buildAdultFields() {
    List<Widget> adultFields = [];
    for (int i = 0; i < adultsCount; i++) {
      adultFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adult ${i + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: whitecolor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: adultNameControllers[i],
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: colorteal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: adultAgeControllers[i],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      hintStyle: TextStyle(color: colorteal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }
    return adultFields;
  }

  List<Widget> buildchildrenFields() {
    List<Widget> childrenFields = [];
    for (int i = 0; i < childrenCount; i++) {
      childrenFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Childrens ${i + 1}'),
            TextFormField(
              controller: childrenNameControllers[i],
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: childrenAgeControllers[i],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }
    return childrenFields;
  }

  void _submitDetails() {
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
      body: BlocListener<PackageBloc, PackageState>(
        listener: (context, state) {
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
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mediaqueryheight(0.07, context),
                    width: mediaquerywidht(0.9, context),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: whitecolor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Number of Adults:',
                          style: TextStyle(color: colorteal),
                        ),
                        Container(
                          width: mediaquerywidht(0.14, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorteal),
                          ),
                          child: TextFormField(
                            controller: adultsController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                adultsCount = int.tryParse(value) ?? 1;

                                if (adultsCount > adultNameControllers.length) {
                                  adultNameControllers.addAll(List.generate(
                                      adultsCount - adultNameControllers.length,
                                      (index) => TextEditingController()));
                                  adultAgeControllers.addAll(List.generate(
                                      adultsCount - adultAgeControllers.length,
                                      (index) => TextEditingController()));
                                } else {
                                  adultNameControllers.removeRange(
                                      adultsCount, adultNameControllers.length);
                                  adultAgeControllers.removeRange(
                                      adultsCount, adultAgeControllers.length);
                                }
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  Container(
                    height: mediaqueryheight(0.07, context),
                    width: mediaquerywidht(0.9, context),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: whitecolor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Number of Children:',
                          style: TextStyle(color: colorteal),
                        ),
                        Container(
                          width: mediaquerywidht(0.14, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorteal),
                          ),
                          child: TextFormField(
                            controller: childrenController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                childrenCount = int.tryParse(value) ?? 0;

                                if (childrenCount >
                                    childrenNameControllers.length) {
                                  childrenNameControllers.addAll(List.generate(
                                      childrenCount -
                                          childrenNameControllers.length,
                                      (index) => TextEditingController()));
                                  childrenAgeControllers.addAll(List.generate(
                                      childrenCount -
                                          childrenAgeControllers.length,
                                      (index) => TextEditingController()));
                                } else {
                                  childrenNameControllers.removeRange(
                                      childrenCount,
                                      childrenNameControllers.length);
                                  childrenAgeControllers.removeRange(
                                      childrenCount,
                                      childrenAgeControllers.length);
                                }
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  Container(
                    height: mediaqueryheight(0.07, context),
                    width: mediaquerywidht(0.9, context),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: whitecolor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Number of Rooms:',
                          style: TextStyle(color: colorteal),
                        ),
                        Container(
                          width: mediaquerywidht(0.14, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorteal),
                          ),
                          child: TextFormField(
                            controller: roomsController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                roomsCount = int.tryParse(value) ?? 0;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
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
        ),
      ),
    );
  }
}
