// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/hotels_screen/available_hotels.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  String _hotelcity = '';

  DateTime? _checkin;

  DateTime? _checkout;

  int _numberofquests = 1;

  int _numberofrooms = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: whitecolor,
                    ),
                    SizedBox(
                      width: mediaquerywidht(0.20, context),
                    ),
                    mytext("SEARCH HOTELS",
                        fontFamily: sedan, fontSize: 22, color: whitecolor)
                  ],
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.04, context),
              ),
              Container(
                width: mediaqueryheight(0.43, context),
                height: mediaqueryheight(0.5, context),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: blackcolor,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(1, 4),
                    ),
                  ],
                  color: whitecolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    _buildTextField('City , Hotel , Area ', Icons.local_hotel,
                        (value) => _hotelcity = value),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDatePicker('Check in', (date) => _checkin = date),
                        _buildDatePicker(
                            'Checkout', (date) => _checkout = date),
                      ],
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDropdown('No.of quests', ['1', '2', '3', '4'],
                            (value) => _numberofquests = int.parse(value)),
                        _buildDropdown('No.of rooms', ['1', '2', '3'],
                            (value) => _numberofrooms = int.parse(value)),
                      ],
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AvailableHOtels()));
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
                            child: mytext("SEARCH FLIGHTS",
                                fontFamily: sedan,
                                fontSize: 20,
                                color: whitecolor)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.04, context),
              ),
              mytext("RECENT SEARCHES",
                  fontFamily: sedan, fontSize: 20, color: whitecolor),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              Container(
                height: mediaqueryheight(0.10, context),
                width: mediaquerywidht(0.9, context),
                decoration: BoxDecoration(
                  color: whitecolor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: blackcolor,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(1, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mytext("Calicut , mankavu",
                        fontFamily: sedan, fontSize: 24, color: colorteal),
                    mytext("08 apr 24 / 2 Quests / 1 Room",
                        fontFamily: sedan, fontSize: 24, color: colorteal),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, Function(String) onChanged) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.teal),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDatePicker(String label, Function(DateTime?) onChanged) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextFormField(
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.teal),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
        ),
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            onChanged(picked);
          }
        },
      ),
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, Function(String) onChanged) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.teal),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0)),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          if (value != null) {
            setState(() {
              onChanged(value);
            });
          }
        },
      ),
    );
  }
}
