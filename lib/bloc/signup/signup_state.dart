part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {
  SignupInitial();
}

final class ConfirmPasswordState extends SignupState {
  final bool isConfirmed;

  ConfirmPasswordState({required this.isConfirmed});
}

final class AddingToDataToFirebase extends SignupState {}

final class Imagenotpicked extends SignupState {}

// ignore: must_be_immutable
final class Signupsuccess extends SignupState {
  late String userEmail;
}

final class Signupfailure extends SignupState {}

final class NavigateToEmailVerficationPage extends SignupState {}

final class AuthLoading extends SignupState {}

final class Authenticated extends SignupState {}

final class Unauthenticated extends SignupState {}

final class Registerfail extends SignupState {
  final String exception;

  Registerfail(this.exception);
}

final class NavigateHomePage extends SignupState {}

final class Networkerror extends SignupState {}

final class UsernameExists extends SignupState {}

final class LoadingStateOtpScreen extends SignupState {}
