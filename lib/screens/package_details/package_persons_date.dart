import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/package_details/package_price.dart';
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
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: whitecolor,
          ),
          child: AppBar(
            leading: const Icon(
              Icons.arrow_back_ios,
              color: colorteal,
            ),
            centerTitle: true,
            title: mytext(
              'ADD PERSON',
              fontFamily: bodoni,
              fontSize: 25,
              color: colorteal,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                              adultsCount = int.tryParse(value) ?? 0;
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PackagePrice()));
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
    );
  }
}
