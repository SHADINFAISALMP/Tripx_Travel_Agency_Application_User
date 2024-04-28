part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Togglepasswordviiblity extends LoginEvent {
  final bool isVisible;

  Togglepasswordviiblity({required this.isVisible});
}

final class LoginEventButton extends LoginEvent {}

final class Verifyemailpressedfromlogin extends LoginEvent {
  final BuildContext context;

  Verifyemailpressedfromlogin(this.context);
}

final class ResendEmailFromLogin extends LoginEvent{
  
}