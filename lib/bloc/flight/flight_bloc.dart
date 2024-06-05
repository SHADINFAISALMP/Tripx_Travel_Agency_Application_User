import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tripx_user_application/bloc/flight/flight_event.dart';
import 'package:tripx_user_application/bloc/flight/flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc() : super(FlightInitial()) {
    on<SearchFlights>(_onSearchFlights);
  }

  Future<void> _onSearchFlights(
      SearchFlights event, Emitter<FlightState> emit) async {
    emit(FlightLoading());

    try {
      final response = await http.get(
        Uri.parse(
          'https://serpapi.com/search.json?engine=google_flights&type=2&departure_id=${event.departureCity}&arrival_id=${event.arrivalCity}&gl=us&hl=en&currency=USD&outbound_date=${event.departureDate.toIso8601String().substring(0, 10)}&api_key=6c85fbfd79fdcabfe8b5366842b277c39501f6eabded41ad96ceda658b200efc',
        ),
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('best_flights')) {
          emit(FlightLoaded(jsonResponse['best_flights']));
        } else {
          emit(const FlightError('No flights found for the given criteria'));
        }
      } else {
        emit(const FlightError('Error fetching flight details'));
      }
    } catch (e) {
      emit(FlightError('An error occurred: $e'));
    }
  }
}
