import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/hotels_screen/hotel_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class AvailableHOtels extends StatefulWidget {
  const AvailableHOtels({super.key});

  @override
  State<AvailableHOtels> createState() => _AvailableHOtelsState();
}

class _AvailableHOtelsState extends State<AvailableHOtels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: whitecolor,
                  ),
                ),
                SizedBox(
                  width: mediaquerywidht(0.30, context),
                ),
                mytext("HOTELS",
                    fontFamily: sedan, fontSize: 22, color: whitecolor)
              ],
            ),
          ),
          SizedBox(
            height: mediaqueryheight(0.04, context),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HotelDetails()));
            },
            child: Container(
              height: mediaqueryheight(0.5, context),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: double.infinity,
                      height: mediaqueryheight(0.25, context),
                      child: Image.network(
                        "https://luxurycolumnist.com/wp-content/uploads/2021/07/titanic-mardan-palace.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        mytext("The GateWay Hotel Beach Road",
                            fontFamily: sedan, fontSize: 24, color: colorteal),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 24,
                              color: blackcolor,
                            ),
                            mytext("PT Usha Road , Calicut ,Kerala",
                                fontFamily: sedan,
                                fontSize: 20,
                                color: colorteal),
                          ],
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            mytext("Break Fast included ",
                                overflow: TextOverflow.ellipsis,
                                fontFamily: sedan,
                                fontSize: 20,
                                color: colorteal),
                            Container(
                              height: mediaqueryheight(0.05, context),
                              width: mediaquerywidht(0.25, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Text(
                                  "4.2/5",
                                  style: TextStyle(
                                      fontFamily: bodoni,
                                      fontSize: 20,
                                      color: whitecolor,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                          color: colorteal,
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.food_bank,
                                  color: colorteal,
                                  size: 35,
                                ),
                                mytext("Resturant",
                                    fontFamily: bodoni,
                                    fontSize: 19,
                                    color: colorteal)
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.room_service,
                                  color: colorteal,
                                  size: 35,
                                ),
                                mytext("Service",
                                    fontFamily: bodoni,
                                    fontSize: 19,
                                    color: colorteal)
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.wifi,
                                  color: colorteal,
                                  size: 35,
                                ),
                                mytext("WIfi",
                                    fontFamily: bodoni,
                                    fontSize: 19,
                                    color: colorteal)
                              ],
                            ),
                            Column(
                              children: [
                                mytext("+₹200 Tax",
                                    fontFamily: bodoni,
                                    fontSize: 20,
                                    color: colorteal),
                                mytext("₹1500",
                                    fontFamily: bodoni,
                                    fontSize: 20,
                                    color: colorteal)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
