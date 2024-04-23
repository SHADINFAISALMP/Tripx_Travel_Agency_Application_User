part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Togglepasswordviiblity extends LoginEvent {
  final bool isVisible;

  Togglepasswordviiblity({required this.isVisible});
}
