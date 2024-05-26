import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class HeadingWelcom extends StatelessWidget {
  const HeadingWelcom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mediaqueryheight(.051, context),
      ),
      child: mytext(
        "WELCOME",
        color: Colors.white70,
        fontFamily: 'sedan',
        fontSize: mediaqueryheight(.030, context),
      ),
    );
  }
}
