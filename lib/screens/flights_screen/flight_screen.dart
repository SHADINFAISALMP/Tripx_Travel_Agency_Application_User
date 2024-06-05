// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/flight/flight_bloc.dart';
import 'package:tripx_user_application/bloc/flight/flight_event.dart';
import 'package:tripx_user_application/bloc/flight/flight_state.dart';
import 'package:tripx_user_application/screens/flights_screen/available_flights/available_flights.dart';
import 'package:tripx_user_application/screens/flights_screen/buildtextfield.dart';
import 'package:tripx_user_application/screens/flights_screen/heading_icon.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen>
    with SingleTickerProviderStateMixin {
  String _departureCity = 'NYCA';
  String? _arrivalCity;
  DateTime? _departureDate;
  // bool _loading = false;
  // final List<dynamic> _flightDetails = [];
  final TextEditingController _departureDateController =
      TextEditingController();

  @override
  void dispose() {
    _departureDateController.dispose();
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
                width: mediaquerywidht(0.9, context),
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
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    buildTextField(
                        'Departure City',
                        Icons.flight_takeoff_outlined,
                        (value) => _departureCity = value,
                        context),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    buildTextField('Arrival City', Icons.flight_land_outlined,
                        (value) => _arrivalCity = value, context),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    buildDatePicker('Departure Date', _departureDateController,
                        (date) {
                      _departureDate = date;
                      _departureDateController.text = date != null
                          ? '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
                          : '';
                    }),
                    SizedBox(
                      height: mediaqueryheight(0.03, context),
                    ),
                    InkWell(
                      onTap: () {
                        if (_arrivalCity == null || _departureDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please fill in all fields')),
                          );
                          return;
                        }
                        String departureCity = _departureCity.toUpperCase();
                        String arrivalCity = _arrivalCity!.toUpperCase();

                        if (!RegExp(r'^[A-Z]{3}$').hasMatch(departureCity) ||
                            !RegExp(r'^[A-Z]{3}$').hasMatch(arrivalCity)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please enter valid 3-letter IATA codes for cities')),
                          );
                          return;
                        }

                        context.read<FlightBloc>().add(SearchFlights(
                              departureCity: departureCity,
                              arrivalCity: arrivalCity,
                              departureDate: _departureDate!,
                            ));
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
                    ),
                    BlocBuilder<FlightBloc, FlightState>(
                      builder: (context, state) {
                        if (state is FlightLoading) {
                          return Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
                            color: colorteal,
                            size: 60,
                          ));
                        } else if (state is FlightLoaded) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.flightDetails.length,
                              itemBuilder: (context, index) {
                                final flight = state.flightDetails[index];
                                return FlightItem(flight: flight);
                              },
                            ),
                          );
                        } else if (state is FlightError) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        return Container();
                      },
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

  Widget buildDatePicker(String label, TextEditingController controller,
      Function(DateTime?) onChanged) {
    ThemeData themeData = ThemeData(
      primaryColor: colorteal,
      colorScheme: const ColorScheme.light(
        primary: colorteal,
        onPrimary: whitecolor,
        onSurface: colorteal,
      ),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.teal,
        controller: controller,
        readOnly: true,
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
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: themeData.copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: colorteal,
                    onPrimary: whitecolor,
                    onSurface: colorteal,
                  ),
                  buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                  ),
                  dialogBackgroundColor: whitecolor,
                ),
                child: child!,
              );
            },
          );
          if (picked != null) {
            onChanged(picked);
            setState(() {
              _departureDate = picked;
            });
          }
        },
      ),
    );
  }
}
