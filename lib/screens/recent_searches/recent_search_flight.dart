import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class FlightRecent extends StatefulWidget {
  const FlightRecent({super.key});

  @override
  State<FlightRecent> createState() => _FlightRecentState();
}

class _FlightRecentState extends State<FlightRecent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: whitecolor,
                    ),
                  ),
                  SizedBox(
                    width: mediaquerywidht(0.04, context),
                  ),
                  mytext("RECENT SEARCHES",
                      fontFamily: sedan, fontSize: 20, color: whitecolor),
                  SizedBox(
                    width: mediaquerywidht(0.04, context),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: whitecolor,
                            title: mytext("Clear Recent Searches",
                                fontFamily: sedan,
                                fontSize: 24,
                                color: Colors.red),
                            content: mytext(
                                "Are you sure you want to clear all recent searches?",
                                fontFamily: sedan,
                                fontSize: 18,
                                color: colorteal),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes',
                                    style: TextStyle(color: Colors.red)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No',
                                    style: TextStyle(color: blackcolor)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 35,
                      color: whitecolor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                height: mediaqueryheight(0.1, context),
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
                  children: [
                    mytext("ccj to dxb     -      one way",
                        fontFamily: sedan, fontSize: 22, color: colorteal),
                    mytext("08 apr 24 / 1 passenger / economy",
                        fontFamily: sedan, fontSize: 20, color: colorteal),
                  ],
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.04, context),
              ),
              Container(
                height: mediaqueryheight(0.1, context),
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
                  children: [
                    mytext("ccj to dxb      -     Round trip",
                        fontFamily: sedan, fontSize: 22, color: colorteal),
                    mytext("08 apr 24 - 09 apr 24/ 1 passenger / economy",
                        fontFamily: sedan, fontSize: 19, color: colorteal),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
