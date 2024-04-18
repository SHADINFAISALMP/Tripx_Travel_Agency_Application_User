import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Headerservices extends StatelessWidget {
  const Headerservices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: mediaquerywidht(.03, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.travel_explore,
                size: mediaqueryheight(.04, context),
                color: whitecolor,
              ),
              SizedBox(
                height: mediaqueryheight(.01, context),
              ),
              mytext("HOLIDAYS",
                  fontFamily: bodoni,
                  fontSize: mediaqueryheight(.017, context),
                  color: whitecolor),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.flight,
                size: mediaqueryheight(.04, context),
                color: whitecolor,
              ),
              SizedBox(
                height: mediaqueryheight(.01, context),
              ),
              mytext("FLIGHTS",
                  fontFamily: bodoni,
                  fontSize: mediaqueryheight(.017, context),
                  color: whitecolor),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.hotel,
                size: mediaqueryheight(.04, context),
                color: whitecolor,
              ),
              SizedBox(
                height: mediaqueryheight(.01, context),
              ),
              mytext("HOTELS",
                  fontFamily: bodoni,
                  fontSize: mediaqueryheight(.017, context),
                  color: whitecolor),
            ],
          ),
        ],
      ),
    );
  }
}
