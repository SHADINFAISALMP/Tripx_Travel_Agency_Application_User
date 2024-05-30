import 'package:tripx_user_application/models/flightradar/aircraft_info.dart';
import 'package:tripx_user_application/models/flightradar/airport_info.dart';
import 'package:tripx_user_application/models/flightradar/all_state.dart';

class FlightRoutes {
  final String? callSign;
  final Route? routes;
  final int? updateTime;
  final String? operatorIata;
  final int? flightnumber;

 late AirportInfo airportInfofrom;
 late AirportInfo  airportInfoto;
 late AirCraftInfo airCraftInfo;
 late AllState state;

  FlightRoutes(
      {this.callSign,
      this.routes,
      this.updateTime,
      this.operatorIata,
      this.flightnumber});

  factory FlightRoutes.fromJson(dynamic json) {
    if (json == null) {
      return FlightRoutes();
    }
    return FlightRoutes(
      callSign: json[''],
      routes: Route.fromArray(json['']),
      updateTime: json[''],
      operatorIata: json[''],
      flightnumber: json[''],
    );
  }
}

class Route {
  final String? fromAirport;
  final String? toAirport;

  Route({this.fromAirport, this.toAirport});

  factory Route.fromArray(dynamic array) {
    return Route(fromAirport: array[0], toAirport: array[1]);
  }
}
