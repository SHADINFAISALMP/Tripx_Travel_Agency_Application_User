part of 'login_bloc.dart';

@immutable
sealed class LoginState {
   
  
}

final class LoginInitial extends LoginState {}

class PasswordVisibleState extends LoginState {
  final bool isVisible;

  PasswordVisibleState( {required this.isVisible});

  
}
