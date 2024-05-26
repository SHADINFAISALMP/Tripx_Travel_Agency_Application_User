import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/header_texts.dart';
import 'package:tripx_user_application/widgets/profile_widgets/logoutbutton.dart';

class Profile_settings extends StatelessWidget {
  const Profile_settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Editprofile())),
          child: Row(
            children: [
              const Icon(
                Icons.mode_edit_outlined,
                color: colorteal,
                size: 30,
              ),
              SizedBox(
                width: mediaquerywidht(0.05, context),
              ),
              mytext("Edit Profile",
                  fontFamily: sedan,
                  fontSize: 20,
                  color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.45, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        GestureDetector(
          child: Row(
            children: [
              const Icon(
                Icons.support_agent_sharp,
                color: colorteal,
                size: 30,
              ),
              SizedBox(
                width: mediaquerywidht(0.05, context),
              ),
              mytext("Support",
                  fontFamily: sedan,
                  fontSize: 20,
                  color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.52, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        Row(
          children: [
            const Icon(
              Icons.star_border_outlined,
              color: colorteal,
              size: 30,
            ),
            SizedBox(
              width: mediaquerywidht(0.05, context),
            ),
            mytext("Rate App",
                fontFamily: sedan,
                fontSize: 20,
                color: colorteal),
            SizedBox(
              width: mediaquerywidht(0.5, context),
            ),
            const Icon(Icons.navigate_next_rounded),
          ],
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        Row(
          children: [
            const Icon(
              Icons.share_outlined,
              color: colorteal,
              size: 30,
            ),
            SizedBox(
              width: mediaquerywidht(0.05, context),
            ),
            mytext("Share App",
                fontFamily: sedan,
                fontSize: 20,
                color: colorteal),
            SizedBox(
              width: mediaquerywidht(0.47, context),
            ),
            const Icon(Icons.navigate_next_rounded),
          ],
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: colorteal,
              size: 30,
            ),
            SizedBox(
              width: mediaquerywidht(0.05, context),
            ),
            mytext("About us",
                fontFamily: sedan,
                fontSize: 20,
                color: colorteal),
            SizedBox(
              width: mediaquerywidht(0.5, context),
            ),
            const Icon(Icons.navigate_next_rounded),
          ],
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        Row(
          children: [
            const Icon(
              Icons.privacy_tip_outlined,
              color: colorteal,
              size: 30,
            ),
            SizedBox(
              width: mediaquerywidht(0.05, context),
            ),
            mytext("Privacy Policy",
                fontFamily: sedan,
                fontSize: 20,
                color: colorteal),
            SizedBox(
              width: mediaquerywidht(0.4, context),
            ),
            const Icon(Icons.navigate_next_rounded),
          ],
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            scaffoldKey.currentState!.openDrawer();
          },
          child: Row(
            children: [
              const Icon(
                Icons.feed_outlined,
                color: colorteal,
                size: 30,
              ),
              SizedBox(
                width: mediaquerywidht(0.05, context),
              ),
              mytext("Send Feedback",
                  fontFamily: sedan,
                  fontSize: 20,
                  color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.38, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        const Logoutbutton(),
        SizedBox(
          height: mediaqueryheight(0.04, context),
        ),
        Center(
          child: Text(
            "Version 1.0.1",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: sedan,
              fontSize: 18,
              color: blackcolor,
            ),
          ),
        )
      ],
    );
  }
}


