import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class PackagePrice extends StatefulWidget {
  const PackagePrice({super.key});

  @override
  _PackagePriceState createState() => _PackagePriceState();
}

class _PackagePriceState extends State<PackagePrice> {
  int numberOfTravelers = 1;

  @override
  Widget build(BuildContext context) {
    final int packageCost = 295000;
    final int perPersonCost = 1000;
    final int hotelNightCost = 1500;
    final int perChildCost = 1000;
    final int taxCharges = 500;
    final int totalPassengersCost = perPersonCost * numberOfTravelers;
    final int totalAmount = packageCost +
        totalPassengersCost +
        hotelNightCost +
        perChildCost +
        taxCharges;
    final int grandTotal = totalAmount * numberOfTravelers;

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
              'PRICE SUMMARY',
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
                UsableContainer(
                  text: 'PACKAGE COST',
                  text2: '₹ $packageCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'PER PERSON',
                  text2: '₹ $perPersonCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'HOTEL NIGHT',
                  text2: '₹ $hotelNightCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'PER CHILD',
                  text2: '₹ $perChildCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'TAX & CHARGES',
                  text2: '₹ $taxCharges',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                Row(
                  children: [
                    Text(
                      'NUMBER OF TRAVELERS: ',
                      style: TextStyle(color: whitecolor, fontSize: 16),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            numberOfTravelers = int.tryParse(value) ?? 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'TOTAL AMOUNT',
                  text2: '₹ $totalAmount',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'GRAND TOTAL',
                  text2: '₹ $grandTotal',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                InkWell(
                  onTap: () {
                    // Handle payment action
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
                        child: mytext(
                          "PAY AMOUNT",
                          fontFamily: sedan,
                          fontSize: 20,
                          color: whitecolor,
                        ),
                      ),
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

class UsableContainer extends StatelessWidget {
  final String text;
  final String text2;

  const UsableContainer({
    super.key,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(color: colorteal),
          ),
          Text(
            text2,
            style: const TextStyle(color: colorteal),
          ),
        ],
      ),
    );
  }
}
