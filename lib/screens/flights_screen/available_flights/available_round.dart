import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class RoundtripAvailableFlights extends StatefulWidget {
  const RoundtripAvailableFlights({super.key});

  @override
  State<RoundtripAvailableFlights> createState() =>
      _RoundtripAvailableFlightsState();
}

class _RoundtripAvailableFlightsState extends State<RoundtripAvailableFlights>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllerround;
  @override
  void initState() {
    super.initState();
    _tabControllerround = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabControllerround.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: whitecolor,
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaquerywidht(0.04, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    "AVAILABLE FLIGHTS",
                    style: TextStyle(
                        fontFamily: sedan,
                        fontSize: 20,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.02, context),
            ),
            mytext("CALICUT TO DUBAI",
                fontFamily: sedan, fontSize: 24, color: whitecolor),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            mytext("08 apr 24 / 2 passenger / first class ",
                fontFamily: sedan, fontSize: 20, color: whitecolor),
            SizedBox(
              height: mediaqueryheight(0.02, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: mediaquerywidht(0.3, context),
                  height: mediaqueryheight(0.06, context),
                  decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "TIME",
                      style: TextStyle(
                          fontFamily: sedan,
                          fontSize: 18,
                          color: colorteal,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: mediaquerywidht(0.3, context),
                  height: mediaqueryheight(0.06, context),
                  decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "DURATION",
                      style: TextStyle(
                          fontFamily: sedan,
                          fontSize: 18,
                          color: colorteal,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: mediaquerywidht(0.3, context),
                  height: mediaqueryheight(0.06, context),
                  decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "PRICE",
                      style: TextStyle(
                          fontFamily: sedan,
                          fontSize: 18,
                          color: colorteal,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.02, context),
            ),
            TabBar(
              indicatorWeight: 4.0,
              indicatorColor: orangecolor,
              controller: _tabControllerround,
              tabs: const [
                Tab(
                  child: Text(
                    "ONWARDS",
                    style: TextStyle(
                      fontFamily: 'Sedan',
                      fontSize: 16,
                      color: whitecolor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "RETURN",
                    style: TextStyle(
                      fontFamily: 'Sedan',
                      fontSize: 16,
                      color: whitecolor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.02, context),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabControllerround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: mediaqueryheight(0.2, context),
                        width: mediaquerywidht(0.9, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whitecolor,
                          boxShadow: const [
                            BoxShadow(
                              color: blackcolor,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(1, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.flight),
                                  mytext("INDIGO",
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: colorteal),
                                  mytext("₹10000",
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: Colors.red),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                                color: colorteal,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  mytext("2 SEAT LEFT",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: Colors.red),
                                ],
                              ),
                              SizedBox(
                                height: mediaqueryheight(0.02, context),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  mytext("19:30",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("4H 20MIN",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("22:45",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                                color: colorteal,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  mytext("CCJ",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("NON STOP",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("DXB",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: mediaqueryheight(0.2, context),
                        width: mediaquerywidht(0.9, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whitecolor,
                          boxShadow: const [
                            BoxShadow(
                              color: blackcolor,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(1, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.flight),
                                  mytext("AIR ASIA",
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: colorteal),
                                  mytext("₹20000",
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: Colors.red),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                                color: colorteal,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  mytext("6 SEAT LEFT",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: Colors.red),
                                ],
                              ),
                              SizedBox(
                                height: mediaqueryheight(0.02, context),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  mytext("19:30",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("4H 20MIN",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("22:45",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                                color: colorteal,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  mytext("DXB",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("NON STOP",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                  mytext("CCJ",
                                      fontFamily: sedan,
                                      fontSize: 19,
                                      color: colorteal),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
