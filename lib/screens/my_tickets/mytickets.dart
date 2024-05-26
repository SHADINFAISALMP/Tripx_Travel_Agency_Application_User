import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/widgets/mytickets_widgets/appbar.dart';
import 'package:tripx_user_application/widgets/mytickets_widgets/no_bookings.dart';

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
    _bookingStream = BookingService.fetchBookingStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: const MyticketsAppbar(),
      body: FutureBuilder<Stream<QuerySnapshot<Map<String, dynamic>>>>(
        future: _bookingStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorteal, size: 60),
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
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorteal, size: 60),
            );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("error ${snapshot.error}"),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return const NoBookings();
                } else {
                  return BookingList(snapshot:snapshot.data!);
                }
              },
            );
          }
        },
      ),
    );
  }
}

