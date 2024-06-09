import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/api_services/flight_service.dart';
import 'package:tripx_user_application/models/flightradar/flights_routes.dart';

class FlightRoutesBloc extends Bloc<FlightRoutesEvent, FlightRouteState> {
  final BuildContext context;

  FlightRoutesBloc(this.context) : super(FlightRoutesLoading());

  Stream<FlightRouteState> mapEventToState(FlightRoutesEvent event) async* {
    if (event is FlightRoutesStarted) {
      yield* _mapFlightRoutesStartedToState(event);
    }
  }

  Stream<FlightRouteState> _mapFlightRoutesStartedToState(
      FlightRoutesStarted event) async* {
    final flightService = FlightService();
    yield FlightRoutesLoading();
    try {
      final response = await flightService.getRoutes(event.flight, event.icao24, context);
      yield FlightRoutesLoaded(response);
    } catch (errormessage) {
      yield FlightRoutesError(errormessage.toString());
    }
  }
}

abstract class FlightRoutesEvent extends Equatable {}

class FlightRoutesStarted extends FlightRoutesEvent {
  final String flight;
  final String icao24;

  FlightRoutesStarted(this.flight, this.icao24);

  @override
  List<Object?> get props => [flight, icao24];
}

abstract class FlightRouteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FlightRoutesLoading extends FlightRouteState {}

class FlightRoutesLoaded extends FlightRouteState {
  final FlightRoutes route;

  FlightRoutesLoaded(this.route);

  @override
  List<Object?> get props => [route];
}

class FlightRoutesError extends FlightRouteState {
  final String errormessage;

  FlightRoutesError(this.errormessage);

  @override
  List<Object?> get props => [errormessage];
}
