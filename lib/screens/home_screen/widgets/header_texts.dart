import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Headertexttwo extends StatelessWidget {
  const Headertexttwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        "WHAT SERVICE ARE YOU LOOKING?",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: 'sedan',
            fontSize: mediaqueryheight(.021, context),
            color: whitecolor,
            fontWeight: FontWeight.normal),
      );
  }
}

class Headertextone extends StatelessWidget {
  const Headertextone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: mediaquerywidht(.5, context),
      ),
      child: mytext(
        "HELLO SHADIN,",
        color: blackcolor,
        fontFamily: 'sedan',
        fontSize: mediaqueryheight(.021, context),
      ),
    );
  }
}
