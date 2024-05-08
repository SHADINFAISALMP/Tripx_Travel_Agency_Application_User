import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails({super.key});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
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
        ],
      )),
    );
  }
}
