import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

SizedBox customtextformfieild(String hinttext, IconData icon, context) {
  return SizedBox(
    width: mediaquerywidht(.9, context),
    child: TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: white70,
        prefixIcon: Icon(icon, color: blackcolor),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: black54,
            fontSize: mediaqueryheight(.021, context),
            fontWeight: FontWeight.w200,
            fontFamily: sedan),
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

SizedBox customtextformfiledpassword(String hinttext, context) {
  return SizedBox(
    width: mediaquerywidht(.9, context),
    child: TextFormField(
      maxLength: 6,
      decoration: InputDecoration(
        filled: true,
        fillColor: white70,
        prefixIcon: const Icon(Icons.password_sharp, color: blackcolor),
        suffixIcon: const Icon(
          Icons.remove_red_eye,
          color: black87,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: black54,
            fontSize: mediaqueryheight(.021, context),
            fontWeight: FontWeight.normal,
            fontFamily: sedan),
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

class Textformfieldphonenumber extends StatelessWidget {
  const Textformfieldphonenumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaquerywidht(.9, context),
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 10,
        decoration: InputDecoration(
          filled: true,
          fillColor: white70,
          prefixIcon: const Icon(Icons.phone, color: blackcolor),
          hintText: 'Enter your phone number',
          hintStyle: TextStyle(
              color: black54,
              fontSize: mediaqueryheight(.021, context),
              fontWeight: FontWeight.normal,
              fontFamily: sedan),
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
