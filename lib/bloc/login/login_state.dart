part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class PasswordVisibleState extends LoginState {
  final bool isVisible;

  PasswordVisibleState({required this.isVisible});
}

final class LoginSuccess extends LoginState {}

final class AuthenicatingUser extends LoginState {}

final class IncorrectDetails extends LoginState {}

final class Networkerror extends LoginState {}

final class LoginstateLogin extends LoginState {}

final class EmailNotVerified extends LoginState {}

final class NavigateToOtpPage extends LoginState {
  final User user;

  NavigateToOtpPage(this.user);
}
final class EmailVerificationFailedFromOtpPage extends LoginState{}

final class LoadingStateLogin extends LoginState{}