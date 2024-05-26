import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaquerywidht(.17, context),
      child: TextFormField(
        maxLength: 1,
        showCursor: false,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              mediaqueryheight(.011, context),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
