import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class AvailableFlights extends StatefulWidget {
  final List<dynamic> flightDetails;

  const AvailableFlights({Key? key, required this.flightDetails})
      : super(key: key);

  @override
  _AvailableFlightsState createState() => _AvailableFlightsState();
}

class _AvailableFlightsState extends State<AvailableFlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: colorteal,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Available Flights",
          style: TextStyle(
            fontFamily: sedan,
            fontSize: 20,
            color: colorteal,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: whitecolor,
      ),
      backgroundColor: colorteal,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: mediaqueryheight(0.03
              , context),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.flightDetails.length,
                itemBuilder: (context, index) {
                  final flight = widget.flightDetails[index];
                  return FlightItem(flight: flight);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const double usdToInrConversionRate = 74.5;

class FlightItem extends StatelessWidget {
  final dynamic flight;

  const FlightItem({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double priceInUsd = (flight['price'] ?? 0.0).toDouble();
    double priceInInr = priceInUsd * usdToInrConversionRate;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              flight['airline_logo'],
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${flight['flights'][0]['departure_airport']['name']} to ${flight['flights'][0]['arrival_airport']['name']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Duration: ${flight['total_duration']} mins',
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Price: \$${priceInInr.toStringAsFixed(2)}',
                    style:
                        const TextStyle(fontSize: 14.0, color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
