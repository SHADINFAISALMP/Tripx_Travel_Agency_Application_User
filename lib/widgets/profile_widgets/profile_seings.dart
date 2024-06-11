import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tripx_user_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_user_application/screens/settings/aboutus.dart';
import 'package:tripx_user_application/screens/settings/privacypoliy.dart';
import 'package:tripx_user_application/screens/settings/support.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/profile_widgets/logoutbutton.dart';

// ignore: camel_case_types
class Profile_settings extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String imagePath;
  const Profile_settings({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.imagePath,
  });
  void _shareApp() {
    Share.share('Check out this amazing app: https://example.com');
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: whitecolor,
          title: const Text(
            'Rate the App',
            style: TextStyle(color: colorteal, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Please rate our app',
                style: TextStyle(color: colorteal, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mediaqueryheight(0.02, context)),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // ignore: avoid_print
                  print(rating);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                  builder: (context) => Editprofile(
                        name: name,
                        email: email,
                        phoneNumber: phoneNumber,
                        password: password,
                        imagePath: imagePath,
                      ))),
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
                  fontFamily: sedan, fontSize: 20, color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.45, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Support()));
          },
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
                  fontFamily: sedan, fontSize: 20, color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.52, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        GestureDetector(
          onTap: () => _showRatingDialog(context),
          child: Row(
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
                  fontFamily: sedan, fontSize: 20, color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.5, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        GestureDetector(
          onTap: () => _shareApp(),
          child: Row(
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
                  fontFamily: sedan, fontSize: 20, color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.47, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUs()));
          },
          child: Row(
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
                  fontFamily: sedan, fontSize: 20, color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.5, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
          },
          child: Row(
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
                  fontFamily: sedan, fontSize: 20, color: colorteal),
              SizedBox(
                width: mediaquerywidht(0.4, context),
              ),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
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
              fontFamily: bodoni,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: blackcolor,
            ),
          ),
        )
      ],
    );
  }
}
