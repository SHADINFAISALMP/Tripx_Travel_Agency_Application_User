import 'package:flutter/material.dart';

import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Mytickets extends StatefulWidget {
  const Mytickets({super.key});

  @override
  State<Mytickets> createState() => _MyticketsState();
}

class _MyticketsState extends State<Mytickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorteal,
        title: mytext("MY BOOKINGS",
            fontFamily: sedan,
            fontSize: mediaqueryheight(0.020, context),
            color: whitecolor),
        centerTitle: true,
      ),
      body: hasBookings() ? _buildBookingsList() : _buildNoBookings(),
    );
  }

  bool hasBookings() {
    // Implement your logic to check if there are bookings
    // For demonstration, let's assume it returns true
    return false;
  }

  Widget _buildBookingsList() {
    // Return your widget that displays the list of bookings
    return Center(child: Text('Bookings List'));
  }

  Widget _buildNoBookings() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/animation.gif', width: 200, height: 200),
          SizedBox(height: 20),
          mytext("Currently No Bookings",
              fontFamily: sedan, fontSize: 16, color: colorteal)
        ],
      ),
    );
  }
}
