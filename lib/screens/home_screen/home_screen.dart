import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/screens/home_screen/widgets/home_carosel.dart';
import 'package:tripx_user_application/screens/home_screen/widgets/drawer.dart';
import 'package:tripx_user_application/screens/home_screen/widgets/header_menu_profile.dart';
import 'package:tripx_user_application/screens/home_screen/widgets/header_texts.dart';
import 'package:tripx_user_application/screens/home_screen/widgets/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late NotchBottomBarController _pageController;
  late List<Widget> pages;

  final GlobalKey<ScaffoldState> scaffoldKey =
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
      key: scaffoldKey, // Assign the key to the Scaffold
      body: Container(
        color: colorteal,
        child: Center(
          child: Column(
            children: [
              const Headermenuprofile(),
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
                height: mediaqueryheight(0.5644, context),
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
                      buildCarousel(),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      buildindicator(),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      buildCarousel()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: Headdrawer(),
      ),
    );
  }

  Widget buildCarousel() => CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realindex) {
        final imagess = images[index];
        return buildImage(imagess, index);
      },
      options: CarouselOptions(
          height: mediaqueryheight(0.4, context),
          autoPlayCurve: Curves.linear,
          onPageChanged: (index, reason) => setState(() => activeindex = index),
          autoPlay: true));

  Widget buildImage(String imagess, int index) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: colorteal,
        ),
        height: mediaqueryheight(0.75, context),
        width: mediaquerywidht(0.75, context),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                imagess,
                height: 280,
                width: mediaquerywidht(0.75, context),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                mytext(locations[index],
                    fontFamily: sedan,
                    fontSize: mediaqueryheight(0.027, context),
                    color: whitecolor)
              ],
            )
          ],
        ),
      );
}