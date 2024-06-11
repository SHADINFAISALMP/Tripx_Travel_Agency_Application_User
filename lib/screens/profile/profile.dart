import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/Userprofile_service.dart.dart';
import 'package:tripx_user_application/widgets/profile_widgets/profile_seings.dart';

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
    _userprofile = UserProfileService.getUserProfileData(userEmail!);
  }

  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
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
                String name = userProfile['name'];
                String email = userProfile['email'];
                String phoneNumber = userProfile['phonenumber'];
                String password = userProfile['password'];
                String imagePath = userProfile['imagepath'];
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: mediaquerywidht(0.2, context),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios),
                                  color: whitecolor,
                                ),
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.20, context),
                              ),
                              mytext(
                                "My Profile",
                                fontFamily: bodoni,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: whitecolor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              bottomRight: Radius.circular(80),
                            ),
                            color: whitecolor),
                        height: mediaqueryheight(0.885, context),
                        width: mediaquerywidht(double.infinity, context),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(imagePath),
                                radius: 70,
                              ),
                            ),
                            mytext(
                              name,
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
                                  mytext("Gmail : $email",
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: sedan,
                                      fontSize: 20,
                                      color: colorteal),
                                  SizedBox(
                                    height: mediaqueryheight(0.01, context),
                                  ),
                                  mytext(
                                      _checkNullOrEmpty("Ph No : $phoneNumber"),
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
                              child: Profile_settings(
                                name: name,
                                email: email,
                                phoneNumber: phoneNumber,
                                password: password,
                                imagePath: imagePath,
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
