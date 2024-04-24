import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super( SignupInitial()) {
    on<Confirmpassword>(_confirmPassword);
  }

  

  void _confirmPassword(Confirmpassword event, Emitter<SignupState> emit) {
    emit(ConfirmPasswordState(
        isConfirmed: event.isconfirmpassword,));
  }
}
