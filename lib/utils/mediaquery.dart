import 'package:flutter/material.dart';

mediaqueryheight(double height, context) {
  return MediaQuery.of(context).size.height * height;
}

mediaquerywidht(double width, context) {
  return MediaQuery.of(context).size.width * width;
}
