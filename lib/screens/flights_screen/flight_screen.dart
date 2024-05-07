// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/available_flights/available_flights.dart';
import 'package:tripx_user_application/screens/available_flights/available_round.dart';
import 'package:tripx_user_application/screens/flights_screen/heading_icon.dart';
import 'package:tripx_user_application/screens/flights_screen/tabBar_Heading.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _deparaturecity = '';
  String _arrivalcity = '';
  String _classofservice = '';
  DateTime? _departuredate;
  DateTime? _returndate;
  int _numbersofpassegngers = 1;
  final bool _directflightonly = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Headiconname(),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                width: mediaqueryheight(0.43, context),
                height: mediaqueryheight(0.8, context),
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
                    TabBarHeading(tabController: _tabController),
                    Expanded(
                      child: TabBarView(
                        viewportFraction: 2,
                        controller: _tabController,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildTextField(
                                  'Departure City',
                                  Icons.flight_takeoff_outlined,
                                  (value) => _deparaturecity = value),
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildTextField(
                                  'Arrival City',
                                  Icons.flight_land_outlined,
                                  (value) => _arrivalcity = value),
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildDatePicker('Departure Date',
                                  (date) => _departuredate = date),
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildDropdown(
                                  'Number of Passengers',
                                  ['1', '2', '3', '4', '5', '6', '7'],
                                  (value) =>
                                      _numbersofpassegngers = int.parse(value)),
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildDropdown(
                                  'Class of Service',
                                  ['Economy', 'Business', 'First Class'],
                                  (value) => _classofservice = value),
                              SizedBox(
                                height: mediaqueryheight(0.08, context),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AvailableFlights()));
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
                          Column(
                            children: [
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildTextField(
                                  'Departure City',
                                  Icons.flight_takeoff_outlined,
                                  (value) => _deparaturecity = value),
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              _buildTextField(
                                  'Arrival City',
                                  Icons.flight_land_outlined,
                                  (value) => _arrivalcity = value),
                              SizedBox(
                                height: mediaqueryheight(0.03, context),
                              ),
                              _buildDatePicker('Departure Date',
                                  (date) => _departuredate = date),
                              SizedBox(
                                height: mediaqueryheight(0.03, context),
                              ),
                              _buildDatePicker(
                                  'Return Date', (date) => _returndate = date),
                              SizedBox(
                                height: mediaqueryheight(0.03, context),
                              ),
                              _buildDropdown(
                                  'Number of Passengers',
                                  ['1', '2', '3', '4', '5', '6', '7'],
                                  (value) =>
                                      _numbersofpassegngers = int.parse(value)),
                              SizedBox(
                                height: mediaqueryheight(0.03, context),
                              ),
                              _buildDropdown(
                                  'Class of Service',
                                  ['Economy', 'Business', 'First Class'],
                                  (value) => _classofservice = value),
                              SizedBox(
                                height: mediaqueryheight(0.04, context),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RoundtripAvailableFlights()));
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
                        ],
                      ),
                    ),
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
      width: MediaQuery.of(context).size.width * 0.85,
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
      width: MediaQuery.of(context).size.width * 0.85,
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
