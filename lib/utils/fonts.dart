import 'package:flutter/material.dart';

String sedan = "sedan";
String bodoni = "bodoni";

mytext(String text,
    {required String fontFamily,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight,
    TextOverflow? overflow,  TextOverflow? textAlign}) {
  return Text(
    text,
    
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
