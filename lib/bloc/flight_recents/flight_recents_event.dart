part of 'flight_recents_bloc.dart';

abstract class RecentSearchEvent {}

class AddSearchEvent extends RecentSearchEvent {
  final String departureCity;
  final String arrivalCity;
  final String date;

  AddSearchEvent(this.departureCity, this.arrivalCity, this.date);
}

class ClearSearchesEvent extends RecentSearchEvent {}