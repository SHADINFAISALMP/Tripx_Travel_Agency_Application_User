import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/models/traveller_model.dart';

import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Mytickets extends StatefulWidget {
  const Mytickets({super.key});

  @override
  State<Mytickets> createState() => _MyticketsState();
}

class _MyticketsState extends State<Mytickets> {
  late Future<Stream<QuerySnapshot<Map<String, dynamic>>>> _bookingStream;

  @override
  void initState() {
    super.initState();
    _bookingStream = fetchBookingDetails();
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>>
      fetchBookingDetails() async {
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
      return Stream.empty();
    } catch (e) {
      debugPrint('error fetching data : $e');
      return Stream.empty();
    }
  }

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
      body: FutureBuilder<Stream<QuerySnapshot<Map<String, dynamic>>>>(
        future: _bookingStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error ${snapshot.error}"),
            );
          } else {
            return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: snapshot.data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("error ${snapshot.error}"),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return _buildNoBookings();
                } else {
                  return _buildBookingsList(snapshot.data!);
                }
              },
            );
          }
        },
      ),
    );
  }

  bool hasBookings() {
    // Implement your logic to check if there are bookings
    // For demonstration, let's assume it returns true
    return false;
  }

  Widget _buildBookingsList(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final document = snapshot.docs[index];
        final package =
            Travelpackage.fromJson(document.data()! as Map<String, dynamic>);

        // Extracting traveler information
        String travelerInfo = '';
        for (int i = 0; i < package.adults!.length; i++) {
          travelerInfo +=
              '${package.adults![i].name} (${package.adults![i].age}), ';
        }
        for (int i = 0; i < package.children!.length; i++) {
          travelerInfo +=
              '${package.children![i].name} (${package.children![i].age}), ';
        }
        travelerInfo = travelerInfo.substring(0, travelerInfo.length - 2);

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ListTile(
            title: Text(
              "Booking ${index + 1}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.0),
                Text(
                  "Traveler Information:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  travelerInfo,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Adults: ${package.adultcount}, Children: ${package.childrencount}, Rooms: ${package.roomscount}",
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoBookings() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/animation.gif', width: 200, height: 200),
          const SizedBox(height: 20),
          mytext("Currently No Bookings",
              fontFamily: sedan, fontSize: 16, color: colorteal)
        ],
      ),
    );
  }
}
