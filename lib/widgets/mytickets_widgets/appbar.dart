import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class MyticketsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyticketsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Bottomnavigation()));
        },
        color: whitecolor,
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      backgroundColor: colorteal,
      title: mytext("MY BOOKINGS",
          fontFamily: sedan,
          fontSize: mediaqueryheight(0.020, context),
          color: whitecolor),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BookingService {
  static Future<Stream<QuerySnapshot<Map<String, dynamic>>>>
      fetchBookingStream() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userEmail = user.email;
        if (userEmail != null) {
          final userQueryDocumentSnapshot = await FirebaseFirestore.instance
              .collection('userdetails')
              .where('email', isEqualTo: userEmail)
              .get();
          if (userQueryDocumentSnapshot.docs.isNotEmpty) {
            final userDocsnapshot = userQueryDocumentSnapshot.docs.first;
            final bookingStream = FirebaseFirestore.instance
                .collection('userdetails')
                .doc(userDocsnapshot.id)
                .collection('travelpackagedetails')
                .snapshots();
            return bookingStream;
          }
        }
      }
      return const Stream.empty();
    } catch (e) {
      print('error fetching data : $e');
      return const Stream.empty();
    }
  }
}
