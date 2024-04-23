import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Togglepasswordviiblity>((event, emit) {
      emit(PasswordVisibleState(isVisible: event.isVisible));
    });
  }
}
