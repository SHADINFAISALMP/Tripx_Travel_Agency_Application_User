// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/packages_widgets/details_showing_contents.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDetails extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> itemslists;

  const PackageDetails({Key? key, required this.itemslists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String startDate = itemslists['startdate'] ?? '';
    String endDate = itemslists['enddate'] ?? '';
    String packageName = itemslists['packagename'] ?? '';
    String placeName = itemslists['placenames'] ?? '';
    int days = int.tryParse(itemslists['days'] ?? '0') ?? 0;

    int nights = int.tryParse(itemslists['night'] ?? '0') ?? 0;

    String transportation = itemslists['transportation'] ?? '';
    double perAdult = double.tryParse(itemslists['adult'] ?? '0.0') ?? 0.0;

    double perChild = double.tryParse(itemslists['childper'] ?? '0.0') ?? 0.0;

    double perHotelNight =
        double.tryParse(itemslists['hotelper'] ?? '0.0') ?? 0.0;
    double packageAmount =
        double.tryParse(itemslists['packageamount'] ?? '0.0') ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Bottomnavigation()));
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text("PACKAGE DETAILS"),
        titleTextStyle: const TextStyle(color: whitecolor, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: whitecolor,
                ),
                child: CarouselSlider.builder(
                  itemCount: itemslists['imagepath'].length,
                  itemBuilder: (context, index, realIndex) {
                    List<String> imagess =
                        (itemslists['imagepath'] as List<dynamic>)
                            .cast<String>();
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imagess[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.4,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: colorteal,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: mediaqueryheight(0.5747, context),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(Icons.phone, () async {
                            final Uri url =
                                Uri(scheme: 'tel', path: '9072051005');

                            if (await canLaunchUrl(url)) {
                              launchUrl(url);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "can't do the call",
                                  style: TextStyle(color: colorteal),
                                ),
                                backgroundColor: whitecolor,
                              ));
                            }
                          }),
                          _buildActionButton(Icons.message, () async {
                            final Uri url =
                                Uri(scheme: 'sms', path: '9072051005');

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "can't do the sms",
                                  style: TextStyle(color: colorteal),
                                ),
                                backgroundColor: whitecolor,
                              ));
                            }
                          }),
                          _buildActionButton(Icons.directions, () async {
                            final Uri url = Uri(
                              scheme: 'geo',
                              path: '11.258260547089058, 75.79156079541575',
                            );

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "can't do the direction",
                                  style: TextStyle(color: colorteal),
                                ),
                                backgroundColor: whitecolor,
                              ));
                            }
                          }),
                          _buildActionButton(Icons.share, () async {
                            final String packageDetails = 'Package Details:\n'
                                'Package Name: $packageName\n'
                                'Place: $placeName\n'
                                'Days: $days\n'
                                'Nights: $nights\n'
                                'Transportation: $transportation\n'
                                'Per Adult: $perAdult\n'
                                'Per Children: $perChild\n'
                                'Per Hotel Night: $perHotelNight\n'
                                'Package Amount: $packageAmount\n';
                            // 'Start Date: $startDate\n'
                            // 'End Date: $endDate\n';

                            Share.share(packageDetails);
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Detailsshowingcontents(
                            itemslists: itemslists,
                            startDate: startDate,
                            endDate: endDate),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildActionButton(IconData icon, void Function() onPressed) {
  return Container(
    width: 50, 
    height: 50, 
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: orangecolor, 
        width: 2.0, 
      ),
    ),
    child: CircleAvatar(
      radius: 23,
      backgroundColor: Colors.teal,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    ),
  );
}
