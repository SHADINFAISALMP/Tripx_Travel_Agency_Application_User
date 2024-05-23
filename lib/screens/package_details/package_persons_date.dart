import 'package:cloud_firestore/cloud_firestore.dart';
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
  final QueryDocumentSnapshot<Object?> itemslists;
  const PackagePerson({Key? key, required this.itemslists}) : super(key: key);

  @override
  _PackagePersonState createState() => _PackagePersonState();
}

class _PackagePersonState extends State<PackagePerson> {
  int adultsCount = 0;
  int childrenCount = 0;
  int roomsCount = 1;
  List<TextEditingController> adultNameControllers = [];
  List<TextEditingController> adultAgeControllers = [];
  List<TextEditingController> childrenNameControllers = [];
  List<TextEditingController> childrenAgeControllers = [];
  TextEditingController adultsController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController roomsController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<PackageBloc>().add(UpdateAdultsCount(adultsCount));
    context.read<PackageBloc>().add(UpdateChildrenCount(childrenCount));
    context.read<PackageBloc>().add(UpdateRoomsCount(roomsCount));
    _initializeControllers(adultsCount, childrenCount);
  }

  void _initializeControllers(int adultCount, int childrenCount) {
    adultNameControllers.clear();
    adultAgeControllers.clear();
    childrenNameControllers.clear();
    childrenAgeControllers.clear();
    for (int i = 0; i < adultCount; i++) {
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
            const SnackBar(content: Text('Travel package saved successfully!')),
          );
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PackagePrice(
                    itemslists: widget.itemslists,
                    adultsCount: adultsCount,
                    childrenCount: childrenCount,
                    roomsCount: roomsCount,
                  )));
        } else if (state is Packageerror) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save travel package!')),
          );
        }
      }, builder: (context, state) {
        if (state is PackageLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PackageUpdated) {
          print("shadin");
          adultsCount = state.adultcount;
          childrenCount = state.childrencount;
          roomsCount = state.roomscount;
          print("shadin");
          _initializeControllers(adultsCount, childrenCount);

          while (adultNameControllers.length < adultsCount) {
            adultNameControllers.add(TextEditingController());
            adultAgeControllers.add(TextEditingController());
          }
          while (adultNameControllers.length > adultsCount) {
            adultNameControllers.removeLast();
            adultAgeControllers.removeLast();
          }

          while (childrenNameControllers.length < childrenCount) {
            childrenNameControllers.add(TextEditingController());
            childrenAgeControllers.add(TextEditingController());
          }
          while (childrenNameControllers.length > childrenCount) {
            childrenNameControllers.removeLast();
            childrenAgeControllers.removeLast();
          }

          adultsController.text = state.adultcount.toString();
          childrenController.text = state.childrencount.toString();
          roomsController.text = state.roomscount.toString();
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

  List<Widget> buildAdultFields() {
    if (adultNameControllers.isEmpty || adultAgeControllers.isEmpty) {
      return [const Text('No adults specified')];
    }
    return List<Widget>.generate(adultsCount, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adult ${index + 1}',
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
                  controller: adultNameControllers[index],
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
                  controller: adultAgeControllers[index],
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
      );
    });
  }

  List<Widget> buildchildrenFields() {
    if (childrenNameControllers.isEmpty || childrenAgeControllers.isEmpty) {
      return [const Text('No children specified')];
    }
    return List<Widget>.generate(childrenCount, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Children ${index + 1}',
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
                  controller: childrenNameControllers[index],
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
                  controller: childrenAgeControllers[index],
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
      );
    });
  }
}
