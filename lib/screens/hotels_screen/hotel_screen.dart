// ignore_for_file: unused_field, use_build_context_synchronously

// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/hotel/hotel_bloc.dart';
import 'package:tripx_user_application/bloc/hotel/hotel_state.dart';
import 'package:tripx_user_application/screens/hotels_screen/hotel_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  String? _hotelcity;
  DateTime? _checkin;
  DateTime? _checkout;
  final bool _loading = false;
  final List<dynamic> _hotelDetails = [];
  final TextEditingController _checkincontroller = TextEditingController();
  final TextEditingController _checkoutcontroller = TextEditingController();

  @override
  void dispose() {
    _checkincontroller.dispose();
    _checkoutcontroller.dispose();
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
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: whitecolor,
                      ),
                    ),
                    SizedBox(
                      width: mediaquerywidht(0.15, context),
                    ),
                    mytext("SEARCH HOTELS",
                        fontFamily: sedan, fontSize: 22, color: whitecolor)
                  ],
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              Container(
                width: mediaquerywidht(0.9, context),
                height: mediaqueryheight(0.85, context),
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
                    _buildTextField('City, Hotel, Area', Icons.local_hotel,
                        (value) => _hotelcity = value),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDatePicker('Check in', (date) {
                          setState(() {
                            _checkin = date;
                          });
                        }, _checkincontroller),
                        _buildDatePicker('Checkout', (date) {
                          setState(() {
                            _checkout = date;
                          });
                        }, _checkoutcontroller),
                      ],
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.04, context),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<HotelCubit>(context).searchHotels(
                          _hotelcity,
                          _checkin,
                          _checkout,
                        );
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
                            child: mytext("SEARCH HOTELS",
                                fontFamily: sedan,
                                fontSize: 20,
                                color: whitecolor)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<HotelCubit, HotelState>(
                      builder: (context, state) {
                        if (state is HotelLoading) {
                          return Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: colorteal,
                              size: 60,
                            ),
                          );
                        } else if (state is HotelLoaded) {
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.hotelDetails.length,
                              itemBuilder: (context, index) {
                                final hotel = state.hotelDetails[index];
                                return HotelItem(hotel: hotel);
                              },
                            ),
                          );
                        } else if (state is HotelError) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else {
                          return const Center(
                            child: Text('No hotels found'),
                          );
                        }
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

  Widget _buildDatePicker(
    String label,
    Function(DateTime?) onChanged,
    TextEditingController controller,
  ) {
    ThemeData themeData = ThemeData(
      primaryColor: colorteal,
      colorScheme: const ColorScheme.light(
        primary: colorteal,
        onPrimary: whitecolor,
        onSurface: colorteal,
      ),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.teal,
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
            controller.text = picked.toString().substring(0, 10);
          }
        },
      ),
    );
  }
}
