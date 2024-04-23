part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class Imagebuttonpress extends SignupEvent{
  
}

final class Confirmpassword extends SignupEvent{
   final bool isconfirmpassword;

  Confirmpassword({required this.isconfirmpassword});
}