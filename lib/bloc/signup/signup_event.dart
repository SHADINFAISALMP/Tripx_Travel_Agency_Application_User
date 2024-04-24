part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}



final class Confirmpassword extends SignupEvent{
   final bool isconfirmpassword;

  Confirmpassword({required this.isconfirmpassword});
}
final class Signupbuttonpress extends SignupEvent{
  
}