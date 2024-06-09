// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/models/flightradar/all_state.dart';
import 'package:tripx_user_application/models/flightradar/flights_routes.dart';
import 'package:tripx_user_application/screens/flight_radar/flight_routes_bloc.dart';
import 'package:tripx_user_application/screens/flight_radar/routeinfo.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class FlightInfoScreen extends StatelessWidget {
  final AllState info;

  const FlightInfoScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightRoutesBloc(context)
        ..add(
          FlightRoutesStarted(info.callsign!, info.icao24!),
        ),
      child: Scaffold(
        backgroundColor: whitecolor,
        body: Stack(
          children: <Widget>[
            BlocBuilder<FlightRoutesBloc, FlightRouteState>(
              builder: (context, state) {
                if (state is FlightRoutesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FlightRoutesLoaded) {
                  FlightRoutes routes = state.route;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: colorteal)),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.navigate_before,
                                color: orangecolor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/flightradar1.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Flight ${routes.operatorIata}${routes.flightnumber}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: orangecolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: mediaqueryheight(1.9, context),
                        child: Routeinfo(
                          fromLat: (routes.airportInfofrom != null)
                              ? routes.airportInfofrom.position!.latitude
                              : 0,
                          fromlon: (routes.airportInfofrom != null)
                              ? routes.airportInfofrom.position!.longitude
                              : 0,
                          toLat: (routes.airportInfoto != null)
                              ? routes.airportInfoto.position!.latitude
                              : 0,
                          toLon: (routes.airportInfoto != null)
                              ? routes.airportInfoto.position!.longitude
                              : 0,
                          icao24:
                              (routes.state != null) ? routes.state.icao24 : '',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  (routes.routes != null)
                                      ? '${routes.routes!.fromAirport}'
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          color: colorteal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                ),
                                Text(
                                  (routes.airportInfofrom != null)
                                      ? '${routes.airportInfofrom.municipality}'
                                      : '',
                                  style: const TextStyle(color: black54),
                                ),
                              ],
                            ),
                            Container(
                              height: 35,
                              width: 70,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/flightradar1.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  (routes.routes != null)
                                      ? '${routes.routes!.toAirport}'
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          color: colorteal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                ),
                                Text(
                                  (routes.airportInfoto != null)
                                      ? '${routes.airportInfoto.municipality}'
                                      : '',
                                  style: const TextStyle(color: black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            displayinfo(
                                context,
                                (routes.airCraftInfo != null)
                                    ? routes.airCraftInfo.model
                                    : '',
                                'Model'),
                            displayinfo(
                                context,
                                (routes.airCraftInfo != null)
                                    ? routes.airCraftInfo.owner
                                    : '',
                                'Owner'),
                            displayinfo(
                                context,
                                (routes != null)
                                    ? '${routes.operatorIata}${routes.flightnumber}'
                                    : '',
                                'Flight'),
                            displayinfo(
                                context,
                                (routes != null) ? routes.state.callsign : '',
                                'Callsign'),
                            displayinfo(
                                context,
                                (routes != null) ? routes.state.velocity : '',
                                'velocity'),
                            displayinfo(
                                context,
                                (routes != null)
                                    ? routes.state.geoAltituce
                                    : '',
                                'Geom. Altitude (M)'),
                            displayinfo(
                                context,
                                (routes != null)
                                    ? routes.state.baroAltitude
                                    : '',
                                'borem. Altitude (M)')
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Container displayinfo(BuildContext context, dynamic info, String title) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            '$title '.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: black54, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text('$info',
              style: const TextStyle(
                  color: orangecolor, overflow: TextOverflow.ellipsis))
        ],
      ),
    );
  }
}
