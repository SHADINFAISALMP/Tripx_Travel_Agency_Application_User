import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/recent_searches/recent_search_flight.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Headiconname extends StatelessWidget {
  const Headiconname({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        mytext("SEARCH FLIGHTS",
            fontFamily: sedan, fontSize: 20, color: whitecolor),
        SizedBox(
          width: mediaquerywidht(0.04, context),
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FlightRecent()));
            },
            icon: const Icon(
              Icons.find_replace_outlined,
              size: 35,
              color: whitecolor,
            ))
      ],
    );
  }
}
