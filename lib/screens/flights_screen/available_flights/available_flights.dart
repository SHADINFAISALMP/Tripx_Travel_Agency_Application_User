// import 'package:flutter/material.dart';
// import 'package:tripx_user_application/models/flight_search/flight_searching.dart';
// import 'package:tripx_user_application/utils/colors.dart';
// import 'package:tripx_user_application/utils/fonts.dart';


// class AvailableFlights extends StatefulWidget {
//   final List<FlightSearch> flights;

//   const AvailableFlights({Key? key, required this.flights}) : super(key: key);

//   @override
//   _AvailableFlightsState createState() => _AvailableFlightsState();
// }

// class _AvailableFlightsState extends State<AvailableFlights> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colorteal,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       size: 30,
//                       color: whitecolor,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     "Available Flights",
//                     style: TextStyle(
//                       fontFamily: sedan,
//                       fontSize: 20,
//                       color: whitecolor,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.flights.length,
//                 itemBuilder: (context, index) {
//                   final flight = widget.flights[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       color: whitecolor,
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Text(
//                             //   '${flight.}', // Example: Indigo
//                             //   style: TextStyle(
//                             //     fontFamily: sedan,
//                             //     fontSize: 24,
//                             //     color: colorteal,
//                             //     fontWeight: FontWeight.bold,
//                             //   ),
//                             // ),
//                             const SizedBox(height: 8),
//                             // Text(
//                             //   '₹${flight.currency}', // Example: ₹10000
//                             //   style: TextStyle(
//                             //     fontFamily: sedan,
//                             //     fontSize: 20,
//                             //     color: Colors.red,
//                             //     fontWeight: FontWeight.bold,
//                             //   ),
//                             // ),
//                             const SizedBox(height: 8),
//                             Text(
//                               '${flight.fromEntityId} - ${flight.toEntityId}', // Example: 19:30 - 22:45
//                               style: TextStyle(
//                                 fontFamily: sedan,
//                                 fontSize: 16,
//                                 color: colorteal,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             // Text(
//                             //   '${flight.market} seat(s) left', // Example: 2 seat(s) left
//                             //   style: TextStyle(
//                             //     fontFamily: sedan,
//                             //     fontSize: 16,
//                             //     color: Colors.red,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
