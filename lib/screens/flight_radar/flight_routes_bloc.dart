// ignore_for_file: must_be_immutable

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


import 'package:tripx_user_application/models/flights_routes.dart';
import 'package:tripx_user_application/service/flight_service.dart';

class FlightRoutesBloc extends Bloc<FlightRoutesEvent, FlightRouteState> {
  BuildContext? context;

  FlightRoutesBloc() : super(FlightRoutesLoading());

  Stream<FlightRouteState> mapEventToState(FlightRoutesEvent event) async* {
    if (event is FlightRoutesStated) {
      final flightService = FlightService();
      yield FlightRoutesLoading();
      try {
        final response =
            await flightService.getRoutes(event.flight, event.icao24,context!);
        yield FlightRoutesLoaded(response);
      } catch (errormessage) {
        yield FlightRoutesError(errormessage.toString());
      }
    }
  }
}

abstract class FlightRoutesEvent extends Equatable {}

class FlightRoutesStated extends FlightRoutesEvent {
  final String flight;
  final String icao24;

  FlightRoutesStated(this.flight, this.icao24);

  @override
  List<Object> get props => [flight, icao24];
}

abstract class FlightRouteState extends Equatable {
  late FlightRoutes routes;

  @override
  List<Object> get props => [];
}

class FlightRoutesLoading extends FlightRouteState {}

class FlightRoutesLoaded extends FlightRouteState {
  final FlightRoutes route;

  FlightRoutesLoaded(this.route);

  @override
  List<Object> get props => [route];
}

class FlightRoutesError extends FlightRouteState {
  final String errormessage;

  FlightRoutesError(this.errormessage);

  @override
  List<Object> get props => [errormessage];
}
