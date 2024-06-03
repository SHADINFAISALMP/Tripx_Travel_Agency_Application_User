import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/models/traveller_model.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Fulldetalshowing extends StatelessWidget {
  final DocumentSnapshot document;
  const Fulldetalshowing({Key? key, required this.document}) : super(key: key);

  String _checkNullOrEmpty(dynamic value) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return 'N/A';
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final package =
        Travelpackage.fromJson(document.data()! as Map<String, dynamic>);

    String travelerInfo = '';
    if (package.adults != null) {
      for (var adult in package.adults!) {
        travelerInfo += '${adult.name} (${adult.age}), ';
      }
    }
    if (package.children != null) {
      for (var child in package.children!) {
        travelerInfo += '${child.name} (${child.age}), ';
      }
    }
    if (travelerInfo.isNotEmpty) {
      travelerInfo = travelerInfo.substring(0, travelerInfo.length - 2);
    } else {
      travelerInfo = 'N/A';
    }

    return Scaffold(
      backgroundColor: colorteal,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          ' ${_checkNullOrEmpty(package.packagename).toUpperCase()} DETAILS',
          style: TextStyle(
              fontFamily: sedan, fontWeight: FontWeight.bold, color: colorteal),
        ),
        centerTitle: true,
        backgroundColor: whitecolor,
        iconTheme: const IconThemeData(
          color: colorteal,
        ),
        toolbarHeight: 60,
      ),
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                    color: whitecolor, size: 60),
              );
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/time.png',
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: mediaqueryheight(0.60, context),
                        width: mediaquerywidht(0.95, context),
                        decoration: BoxDecoration(
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                _buildDetailRow(
                                  'Package Name :',
                                  _checkNullOrEmpty(package.packagename)
                                      .toUpperCase(),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Place Names :',
                                  _checkNullOrEmpty(package.placename)
                                      .toUpperCase(),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Traveler Info :',
                                  travelerInfo.toUpperCase(),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Adult count :',
                                  _checkNullOrEmpty(package.adultcount),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Childrens Count :',
                                  _checkNullOrEmpty(package.childrencount),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Rooms Count :',
                                  _checkNullOrEmpty(package.roomscount),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Adult Price :',
                                  _checkNullOrEmpty("₹${package.adultprice}"),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Children Price :',
                                  _checkNullOrEmpty("₹${package.childprice}"),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Room Price :',
                                  _checkNullOrEmpty("₹${package.hotelprice}"),
                                ),
                                const SizedBox(height: 16),
                                _buildDetailRow(
                                  'Package Amount :',
                                  _checkNullOrEmpty(
                                      "₹${package.packaageamount}"),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.label_outline_sharp),
                                    const Text(
                                      'Days :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: colorteal,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                    Text(
                                      _checkNullOrEmpty(package.days),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: colorteal,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                    const Text(
                                      'Nights :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: colorteal,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                    Text(
                                      _checkNullOrEmpty(package.night),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: colorteal,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        const Icon(Icons.label_outline_sharp),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: colorteal,
            fontWeight: FontWeight.bold,
            fontFamily: 'Playfair Display',
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              color: colorteal,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playfair Display',
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
