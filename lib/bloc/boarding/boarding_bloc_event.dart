part of 'boarding_bloc_bloc.dart';

@immutable
sealed class BoardingBlocEvent {}

class Boardingbuttonclick extends BoardingBlocEvent {
  final int index;

  Boardingbuttonclick({required this.index});
}

class Boardinggetstartedclick extends BoardingBlocEvent {}
