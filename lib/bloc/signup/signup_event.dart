part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class Confirmpassword extends SignupEvent {
  final bool isconfirmpassword;

  Confirmpassword({required this.isconfirmpassword});
}

final class Signupbuttonpress extends SignupEvent {
  final BuildContext context;

  Signupbuttonpress(this.context);
}

final class AuthenticateUserDetails extends SignupEvent {
  final BuildContext context;

  AuthenticateUserDetails(this.context);
}

final class VerifyEmailPressed extends SignupEvent {
  final BuildContext context;

  VerifyEmailPressed(this.context);
}

final class ResendEmailButtonPressed extends SignupEvent{
  
}
