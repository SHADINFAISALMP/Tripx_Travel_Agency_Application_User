part of 'google_bloc.dart';

@immutable
sealed class GoogleState {}

final class GoogleInitial extends GoogleState {}

final class GoogleLoadingstate extends GoogleState {}

final class GoogleSuccessState extends GoogleState {
  final User  user;

  GoogleSuccessState(this.user);
}

final class GoogleFailureState extends GoogleState {
}
