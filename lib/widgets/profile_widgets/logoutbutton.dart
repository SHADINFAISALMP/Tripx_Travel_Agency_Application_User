import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Logoutbutton extends StatelessWidget {
  const Logoutbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _logout(context);
      },
      child: Row(
        children: [
          const Icon(
            Icons.logout,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(
            width: mediaquerywidht(0.05, context),
          ),
          mytext("Log out",
              fontFamily: sedan,
              fontSize: 20,
              color: Colors.red),
        ],
      ),
    );
  }
}

Future<void> _logout(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: whitecolor,
        title: const Text(
          "Confirm Logout",
          style: TextStyle(color: colorteal),
        ),
        content: const Text(
          "Are you sure you want to log out?",
          style: TextStyle(color: colorteal),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              } catch (e) {
                print("Error signing out: $e");
              }
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "No",
              style: TextStyle(color: colorteal),
            ),
          ),
        ],
      );
    },
  );
}