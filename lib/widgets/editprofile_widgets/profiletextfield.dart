import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class ProfileTextField extends StatelessWidget {
  final IconData prefixIcon;

  final TextEditingController controller;

  const ProfileTextField({super.key, 
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaquerywidht(0.9, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            height: mediaqueryheight(0.003, context),
            color: colorteal,
            backgroundColor: whitecolor,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            prefixIconColor: colorteal,
            fillColor: whitecolor,
            filled: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
