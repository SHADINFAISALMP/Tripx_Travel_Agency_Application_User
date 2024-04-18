import 'package:flutter/material.dart';

String sedan = "sedan";
String bodoni = "bodoni";

mytext(String text,
    {required String fontFamily,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
