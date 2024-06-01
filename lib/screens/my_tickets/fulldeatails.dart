import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        title: Text(
          ' ${_checkNullOrEmpty(package.packagename).toUpperCase()} DETAILS',
          style: TextStyle(
              fontFamily: sedan, fontWeight: FontWeight.bold, color: colorteal),
        ),
        centerTitle: true,
        backgroundColor: whitecolor,
        iconTheme: IconThemeData(
          color: colorteal,
        ),
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/time2.png',
                height: 240,
                fit: BoxFit.cover,
              ),
              Container(
                height: mediaqueryheight(0.60, context),
                width: mediaquerywidht(0.95, context),
                decoration: BoxDecoration(
                    color: whitecolor, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        _buildDetailRow(
                          'Package Name :',
                          _checkNullOrEmpty(package.packagename),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Place Names :',
                          _checkNullOrEmpty(package.placename),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Traveler Info :',
                          travelerInfo,
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Adult count :',
                          _checkNullOrEmpty(package.adultcount),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Childrens Count :',
                          _checkNullOrEmpty(package.childrencount),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Rooms Count :',
                          _checkNullOrEmpty(package.roomscount),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Adult Price :',
                          _checkNullOrEmpty(package.adultprice),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Children Price :',
                          _checkNullOrEmpty(package.childprice),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Room Price :',
                          _checkNullOrEmpty(package.hotelprice),
                        ),
                        SizedBox(height: 16),
                        _buildDetailRow(
                          'Package Amount :',
                          _checkNullOrEmpty(package.packaageamount),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.label_outline_sharp),
                            Text(
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
                              style: TextStyle(
                                fontSize: 20,
                                color: colorteal,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Playfair Display',
                              ),
                            ),
                            Text(
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
                              style: TextStyle(
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
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        Icon(Icons.label_outline_sharp),
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: colorteal,
            fontWeight: FontWeight.bold,
            fontFamily: 'Playfair Display',
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
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
