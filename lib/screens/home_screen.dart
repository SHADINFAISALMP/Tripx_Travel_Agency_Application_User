import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/drawer.dart';
import 'package:tripx_user_application/widgets/homescreen_widget/header_menu_profile.dart';
import 'package:tripx_user_application/widgets/homescreen_widget/header_texts.dart';
import 'package:tripx_user_application/widgets/homescreen_widget/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late NotchBottomBarController _pageController;
  late List<Widget> pages;

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Define a GlobalKey

  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      body: Container(
        color: colorteal,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Headermenuprofile(scaffoldKey: _scaffoldKey),
                SizedBox(
                  height: mediaqueryheight(.01, context),
                ),
                const Headertextone(),
                const Headertexttwo(),
                SizedBox(
                  height: mediaqueryheight(.03, context),
                ),
                const Headerservices(),
                SizedBox(
                  height: mediaqueryheight(.03, context),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          mediaqueryheight(.1, context),
                        ),
                      ),
                      color: whitecolor),
                  width: double.infinity,
                  height: mediaqueryheight(.60, context),
                  child: const Column(
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Drawer(
        child: Headdrawer(),
      ),
    );
  }
}
