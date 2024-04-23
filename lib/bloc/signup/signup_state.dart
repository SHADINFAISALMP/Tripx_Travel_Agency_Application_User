part of 'signup_bloc.dart';

@immutable
sealed class SignupState {
  final String imagepath;

  const SignupState({required this.imagepath});
}

final class SignupInitial extends SignupState {
  const SignupInitial({required super.imagepath});
}

final class Imagenotpicked extends SignupState {
  const Imagenotpicked({required super.imagepath});
}

final class ConfirmPasswordState extends SignupState {
  final bool isConfirmed;

  const ConfirmPasswordState({required this.isConfirmed, required super.imagepath});
}

