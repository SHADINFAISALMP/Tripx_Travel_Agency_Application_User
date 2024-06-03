// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  bool _loading = false;
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
                padding: const EdgeInsets.only(left: 20, top: 10),
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
                      onTap: _searchHotels,
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
                    if (_loading)
                      Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: colorteal,
                          size: 60,
                        ),
                      )
                    else
                      Expanded(
                        child: _hotelDetails.isEmpty
                            ? const Center(
                                child: Text('No hotels found'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: _hotelDetails.length,
                                itemBuilder: (context, index) {
                                  final hotel = _hotelDetails[index];
                                  return HotelItem(hotel: hotel);
                                },
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

  Future<void> _searchHotels() async {
    if (_hotelcity!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a search query')),
      );
      return;
    }

    setState(() {
      _loading = true;
      _hotelDetails.clear();
    });

    try {
      final url =
          'https://serpapi.com/search.json?engine=google_hotels&q=$_hotelcity&gl=us&hl=en&currency=USD&check_in_date=${_checkin?.toString().substring(0, 10)}&check_out_date=${_checkout?.toString().substring(0, 10)}&api_key=6c85fbfd79fdcabfe8b5366842b277c39501f6eabded41ad96ceda658b200efc';
      debugPrint('Request URL: $url');
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('hotels') ||
            jsonResponse.containsKey('properties')) {
          final List<dynamic>? data = jsonResponse.containsKey('hotels')
              ? jsonResponse['hotels']
              : jsonResponse['properties'];
          debugPrint('Hotel Data: $data');
          if (data != null && data.isNotEmpty) {
            setState(() {
              _hotelDetails.addAll(data);
              _loading = false;
            });
          } else if (jsonResponse.containsKey('properties')) {
            final List<dynamic> data = jsonResponse['properties'];
            debugPrint('Hotel Data: $data');
            setState(() {
              _hotelDetails.addAll(data);
              _loading = false;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('No hotels found for the given search query')),
            );
            setState(() {
              _loading = false;
            });
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unexpected API response')),
          );
          setState(() {
            _loading = false;
          });
        }
      } else {
        throw Exception(
            'Failed to load hotels. Status code: ${response.statusCode}');
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please check your internet connection')),
      );
      setState(() {
        _loading = false;
      });
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      setState(() {
        _loading = false;
      });
    }
  }
}


