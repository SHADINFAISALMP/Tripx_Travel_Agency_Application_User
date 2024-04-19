import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        centerTitle: true,
        title: mytext("profile",
            fontFamily: sedan,
            fontSize: mediaqueryheight(0.020, context),
            color: whitecolor),
        backgroundColor: colorteal,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: whitecolor,
        ),
      ),
      body: const Column(),
    );
  }
}
