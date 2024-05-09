import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/screens/edit_profile/edit_profile.dart';
import 'package:tripx_user_application/screens/home_screen/widgets/header_texts.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  const Profile({super.key, l});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<DocumentSnapshot> _userprofile;

  @override
  void initState() {
    super.initState();

    _userprofile = getUserProfileData();
  }

  Future<DocumentSnapshot> getUserProfileData() async {
    final userProfileSnapshot =
        await userDetails.where('email', isEqualTo: userEmail).get();
    return userProfileSnapshot.docs.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorteal,
        body: FutureBuilder<DocumentSnapshot>(
            future: _userprofile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                      color: whitecolor, size: 60),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('No data available');
              } else {
                final userProfile =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Center(
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
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                              ),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage("${userProfile['imagepath']}"),
                                radius: 70,
                              ),
                            ),
                            mytext(
                              userProfile['name'],
                              fontFamily: sedan,
                              fontSize: mediaqueryheight(0.03, context),
                              color: colorteal,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: mediaqueryheight(0.03, context)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  mytext("Gmail : ${userProfile['email']}",
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: colorteal),
                                  SizedBox(
                                    height: mediaqueryheight(0.01, context),
                                  ),
                                  mytext(
                                      "Ph No : ${userProfile['phonenumber']}",
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: colorteal),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: mediaqueryheight(0.02, context),
                            ),
                            const Divider(
                              thickness: 2,
                              color: colorteal,
                              endIndent: 30,
                              indent: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: mediaquerywidht(0.06, context)),
                              child: Column(
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
                                  Row(
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
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
