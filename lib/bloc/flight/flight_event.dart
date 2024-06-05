import 'package:equatable/equatable.dart';

abstract class FlightEvent extends Equatable {
  const FlightEvent();

  @override
  List<Object> get props => [];
}

class SearchFlights extends FlightEvent {
  final String departureCity;
  final String arrivalCity;
  final DateTime departureDate;

  const SearchFlights({
    required this.departureCity,
    required this.arrivalCity,
    required this.departureDate,
  });

  @override
  List<Object> get props => [departureCity, arrivalCity, departureDate];
}
