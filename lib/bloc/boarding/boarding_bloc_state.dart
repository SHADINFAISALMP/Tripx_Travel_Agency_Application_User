part of 'boarding_bloc_bloc.dart';

@immutable
sealed class BoardingBlocState {
  final int activepage;

  const BoardingBlocState({required this.activepage});
}

final class BoardingBlocInitial extends BoardingBlocState {
  const BoardingBlocInitial({required super.activepage});
}

class Changeboarding extends BoardingBlocState{
  const Changeboarding({required super.activepage});
  
}

class Boardingnavigate extends BoardingBlocState {
  const Boardingnavigate({required super.activepage});
}
