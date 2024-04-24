part of 'signup_bloc.dart';

@immutable
sealed class SignupState {
  
}

final class SignupInitial extends SignupState {
  SignupInitial();
}
final class ConfirmPasswordState extends SignupState {
  final bool isConfirmed;

   ConfirmPasswordState({required this.isConfirmed});
}



