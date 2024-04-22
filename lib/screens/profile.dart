import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/edit_profile.dart';
import 'package:tripx_user_application/screens/mytickets.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

import '../widgets/homescreen_widget/header_menu_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            mytext("My Profile",
                fontFamily: sedan, fontSize: 22, color: whitecolor),
            SizedBox(
              height: mediaqueryheight(0.04, context),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                  color: whitecolor),
              height: mediaqueryheight(0.873, context),
              width: mediaquerywidht(double.infinity, context),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/paulwalker.jpg'),
                      radius: 70,
                    ),
                  ),
                  mytext(
                    " Paul Walker",
                    fontFamily: sedan,
                    fontSize: mediaqueryheight(0.03, context),
                    color: colorteal,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: mediaqueryheight(0.03, context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mytext("Gmail : paulwalker@gmail.com",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        mytext("Ph No : 1234567890",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        mytext("DOB : 27/11/2004",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal),
                        SizedBox(
                          height: mediaqueryheight(0.01, context),
                        ),
                        mytext("Password : paul@123",
                            overflow: TextOverflow.ellipsis,
                            fontFamily: sedan,
                            fontSize: 20,
                            color: colorteal),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.05, context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: mediaquerywidht(0.05, context)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Editprofile())),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit,
                                color: colorteal,
                                size: 30,
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.05, context),
                              ),
                              mytext("Edit Profile",
                                  fontFamily: sedan,
                                  fontSize: 22,
                                  color: colorteal),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Mytickets())),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.airplane_ticket,
                                color: colorteal,
                                size: 30,
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.05, context),
                              ),
                              mytext("My Tickets",
                                  fontFamily: sedan,
                                  fontSize: 22,
                                  color: colorteal),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.share,
                              color: colorteal,
                              size: 30,
                            ),
                            SizedBox(
                              width: mediaquerywidht(0.05, context),
                            ),
                            mytext("Share App",
                                fontFamily: sedan,
                                fontSize: 22,
                                color: colorteal),
                          ],
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.02, context),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.settings,
                                color: colorteal,
                                size: 30,
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.05, context),
                              ),
                              mytext("Settings",
                                  fontFamily: sedan,
                                  fontSize: 22,
                                  color: colorteal),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryheight(0.1, context),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.logout,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.05, context),
                              ),
                              mytext("Log Out",
                                  fontFamily: sedan,
                                  fontSize: 22,
                                  color: Colors.red),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
