part of 'flight_recents_bloc.dart';

abstract class RecentSearchState {}

class RecentSearchInitial extends RecentSearchState {}

class RecentSearchLoaded extends RecentSearchState {
  final List<Map<String, String>> searches;

  RecentSearchLoaded(this.searches);
}