part of 'boarding_bloc_bloc.dart';

@immutable
sealed class BoardingBlocState {
  final int activepage;

  BoardingBlocState({required this.activepage});
}

final class BoardingBlocInitial extends BoardingBlocState {
  BoardingBlocInitial({required super.activepage});
}

class changeboarding extends BoardingBlocState{
  changeboarding({required super.activepage});
  
}

class Boardingnavigate extends BoardingBlocState {
  Boardingnavigate({required super.activepage});
}
