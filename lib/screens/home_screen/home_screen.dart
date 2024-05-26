
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/Userprofile_service.dart.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/carosel_widgets.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/header_texts.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/home_screen_load.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/homescreen_image_view.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late NotchBottomBarController _pageController;
  late List<Widget> pages;
  late Future<DocumentSnapshot?> _userprofile;

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); 

  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
    _userprofile = UserProfileService.getUserProfileData(userEmail!);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: FutureBuilder(
          future: _userprofile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Buildloadingindicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available');
            } else {
              final userProfile = snapshot.data!.data() as Map<String, dynamic>;

              return homecontent(userProfile, context);
            }
          }),
    );
  }
  Widget homecontent(Map<String, dynamic> userProfile, BuildContext context) {
    return Container(
      color: colorteal,
      child: Center(
        child: Column(
          children: [
            HeaderProfile(userProfile: userProfile),
            SizedBox(
              height: mediaqueryheight(.01, context),
            ),
            const Headertexttwo(),
            SizedBox(
              height: mediaqueryheight(.03, context),
            ),
            const Headerservices(),
            SizedBox(
              height: mediaqueryheight(.03, context),
            ),
            contentcontainer(context),
          ],
        ),
      ),
    );
  }
  Widget contentcontainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              mediaqueryheight(.1, context),
            ),
          ),
          color: whitecolor),
      width: double.infinity,
      height: mediaqueryheight(0.59461, context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
              top: mediaqueryheight(0.02, context),
            )),
            mytext("Popular Destinations",
                fontFamily: sedan,
                fontSize: mediaqueryheight(0.025, context),
                color: blackcolor),
            SizedBox(
              height: mediaqueryheight(0.03, context),
            ),
            Carouselwidgets(packageDetails: packageDetails,),
            SizedBox(
              height: mediaqueryheight(0.02, context),
            ),
            Homescreenimagelistview(packageDetails: packageDetails),
            SizedBox(
              height: mediaqueryheight(0.02, context),
            ),
          ],
        ),
      ),
    );
  }
  
}
