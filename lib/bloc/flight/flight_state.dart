import 'package:equatable/equatable.dart';

abstract class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object> get props => [];
}

class FlightInitial extends FlightState {}

class FlightLoading extends FlightState {}

class FlightLoaded extends FlightState {
  final List<dynamic> flightDetails;

  const FlightLoaded(this.flightDetails);

  @override
  List<Object> get props => [flightDetails];
}

class FlightError extends FlightState {
  final String message;

  const FlightError(this.message);

  @override
  List<Object> get props => [message];
}
