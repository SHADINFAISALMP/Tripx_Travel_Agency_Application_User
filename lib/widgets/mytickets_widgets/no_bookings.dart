import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/models/traveller_model.dart';
import 'package:tripx_user_application/screens/my_tickets/fulldeatails.dart';
import 'package:tripx_user_application/utils/colors.dart';
import '../../utils/fonts.dart';

class NoBookings extends StatelessWidget {
  const NoBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/animation.gif', width: 200, height: 200),
          const SizedBox(height: 20),
          Text("Currently No Bookings",
              style: TextStyle(
                fontFamily: sedan,
                fontSize: 16,
                color: colorteal,
              )),
        ],
      ),
    );
  }
}

class BookingList extends StatelessWidget {
  final QuerySnapshot snapshot;
  const BookingList({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        if (travelerInfo.isNotEmpty) {
          travelerInfo = travelerInfo.substring(0, travelerInfo.length - 2);
        }

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Fulldetalshowing(
                    document: document),
              ),
            );
          }, 

          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              title: Text(
                "Booking ${index + 1}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Package Name: ${package.packagename}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Traveler Information:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    travelerInfo,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Adults: ${package.adultcount}, Children: ${package.childrencount}, Rooms: ${package.roomscount}",
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
