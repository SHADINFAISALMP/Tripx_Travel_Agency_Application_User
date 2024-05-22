import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';

import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
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
  late Future<DocumentSnapshot?> _userprofile;

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Define a GlobalKey

  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
    _userprofile = getUserProfileData();
  }

  Future<DocumentSnapshot> getUserProfileData() async {
    final userProfileSnapshot =
        await userDetails.where('email', isEqualTo: userEmail).get();
    return userProfileSnapshot.docs.first;
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
      body: FutureBuilder(
          future: _userprofile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                    color: colorteal, size: 60),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available');
            } else {
              final userProfile = snapshot.data!.data() as Map<String, dynamic>;

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
                      Container(
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
                              buildCarousel(),
                              SizedBox(
                                height: mediaqueryheight(0.02, context),
                              ),
                              buildListView(),
                              SizedBox(
                                height: mediaqueryheight(0.02, context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  final CollectionReference packageDetails =
      FirebaseFirestore.instance.collection('packagedetails');
  Widget buildCarousel() {
    return StreamBuilder(
        stream: packageDetails.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorteal, size: 60),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Packages available'),
            );
          } else {
            final querySnapshot = snapshot.data as QuerySnapshot;
            final packageCount = querySnapshot.docs.length;
            return CarouselSlider.builder(
                itemCount: packageCount,
                itemBuilder: (context, index, realindex) {
                  final items = snapshot.data!.docs[index];
                  List<String> imagess =
                      (items['imagepath'] as List<dynamic>).cast<String>();
                  return buildImage(imagess.first, index, items);
                },
                options: CarouselOptions(
                    viewportFraction: 0.72,
                    enlargeCenterPage: true,
                    height: mediaqueryheight(0.45, context),
                    autoPlayCurve: Curves.linear,
                    onPageChanged: (index, reason) => null,
                    autoPlay: true));
          }
        });
  }

  Widget buildImage(
          String imagess, int index, QueryDocumentSnapshot<Object?> items) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PackageDetails(
                      itemslists: items,
                    )),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: colorteal,
          ),
          width: mediaquerywidht(0.75, context),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  imagess,
                  height: 300,
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
                  locationname(index, items),
                ],
              )
            ],
          ),
        ),
      );

  locationname(int index, item) {
    return mytext(item['packagename'],
        fontFamily: sedan,
        fontSize: mediaqueryheight(0.027, context),
        color: whitecolor);
  }

  //list view
  Widget buildListView() {
    return StreamBuilder(
      stream: packageDetails.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                color: whitecolor, size: 60),
          );
        }
        final querySnapshot = snapshot.data as QuerySnapshot;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            final item = querySnapshot.docs[index];
            List<String> images =
                (item['imagepath'] as List<dynamic>).cast<String>();
            return buildListItem(images.first, item);
          },
        );
      },
    );
  }

  Widget buildListItem(String imagePath, QueryDocumentSnapshot<Object?> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackageDetails(
              itemslists: item,
            ),
          ),
        );
      },
      child: Container(
        height: mediaqueryheight(0.4, context),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorteal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tour, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['packagename'],
                  fontFamily: sedan,
                  fontSize: 25,
                  color: whitecolor,
                ),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.001, context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.place, color: whitecolor),
                  const SizedBox(width: 5),
                  mytext(item['placenames'],
                      fontFamily: sedan,
                      fontSize: 18,
                      color: whitecolor,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Row(
              children: [
                const SizedBox(width: 35),
                const Icon(Icons.sunny, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['days'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 55),
                const Icon(Icons.nights_stay, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['night'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
                const SizedBox(width: 35),
                const Icon(Icons.attach_money, color: whitecolor),
                const SizedBox(width: 5),
                mytext(
                  item['packageamount'],
                  fontFamily: sedan,
                  fontSize: 18,
                  color: whitecolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
