import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tripx_user_application/models/flightradar/aircraft_info.dart';
import 'package:tripx_user_application/models/flightradar/airport_info.dart';
import 'package:tripx_user_application/models/flightradar/all_state.dart';
import 'package:tripx_user_application/models/flightradar/flights_routes.dart';
import 'dart:async';

class FlightService {
  final Dio _dio = Dio();

  Future<List<AllState>> getAllStateBounds(LatLng sw, LatLng ne ,BuildContext context) async {
    String url =
        'https://opensky-network.org/api/states/all?lamin=${sw.latitude}&lomin=${sw.longitude}&lamax=${ne.latitude}&lomax=${ne.longitude}';
    return _performRequest(() async {
      final response = await _dio.get(url);
      List<AllState> data = (response.data['states'] as List)
          .map((e) => AllState.fromJson(e))
          .toList();

      if (data.length > 350) {
        return data.sublist(0, 350);
      }
      return data;
    },context);
  }

  Future<T> _performRequest<T>(Future<T> Function() request, BuildContext context) async {
    const int maxRetries = 3;
    const int retryDelaySeconds = 2;
    int attempt = 0;

    while (attempt < maxRetries) {
      try {
        return await request();
      } on DioError catch (e) {
        if (e.response?.statusCode == 429) {
          attempt++;
          if (attempt == maxRetries) {
            // Show Snackbar for rate limit exceeded
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Rate limit exceeded. Please try again later.'),
                duration: Duration(seconds: 3),
              ),
            );
            throw Exception('Rate limit exceeded');
          }
          await Future.delayed(const Duration(seconds: retryDelaySeconds));
        } else {
          rethrow; // Rethrow for other errors
        }
      }
    }
    throw Exception('Request failed after $maxRetries attempts');
  }

  Future<FlightRoutes> getRoutes(String flight, String icao24,BuildContext context) async {
    final url =
        'https://opensky-network.org/api/routes?callsign=${flight.trim()}';
    return _performRequest(() async {
      final response = await _dio.get(url);
      FlightRoutes routes = FlightRoutes.fromJson(response.data);
      AirportInfo fromInfo = await getAirportInfo(routes.routes!.fromAirport!,context);
      AirportInfo toInfo = await getAirportInfo(routes.routes!.toAirport!,context);
      AirCraftInfo info = await getAircraftInfo(icao24,context);
      AllState state = await getState(icao24,context);
      routes.airportInfofrom = fromInfo;
      routes.airportInfoto = toInfo;
      routes.airCraftInfo = info;
      routes.state = state;
      return routes;
    },context);
  }

  Future<AirportInfo> getAirportInfo(String icao24,BuildContext context) async {
    final String url = 'https://opensky-network.org/api/airports/?icao=$icao24';
    return _performRequest(() async {
      final response = await _dio.get(url);
      return AirportInfo.fromJson(response.data);
    },context);
  }

  Future<AirCraftInfo> getAircraftInfo(String icao24 ,BuildContext context) async {
    final String url =
        'https://opensky-network.org/api/metadata/aircraft/icao/$icao24';
    return _performRequest(() async {
      final response = await _dio.get(url);
      return AirCraftInfo.fromJson(response.data);
    },context);
  }

  Future<AllState> getState(String icao24,BuildContext context) async {
    final String url =
        'https://opensky-network.org/api/states/all?icao24=$icao24';
    return _performRequest(() async {
      final response = await _dio.get(url);
      return AllState.fromJson(response.data['states'][0]);
    },context);
  }
}
