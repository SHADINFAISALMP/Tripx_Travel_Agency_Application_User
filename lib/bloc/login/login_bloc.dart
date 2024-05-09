import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/firebase_auth/firebase_services.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Togglepasswordviiblity>((event, emit) {
      emit(PasswordVisibleState(isVisible: event.isVisible));
    });
    on<LoginEventButton>(_loginButtonPressed);
    on<Verifyemailpressedfromlogin>(_verifyEmailPressed);
    on<ResendEmailFromLogin>(_resendEmailButtonPressed);
  }

  _loginButtonPressed(LoginEventButton event, Emitter<LoginState> emit) async {
    print("padaaaa");
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      emit(AuthenicatingUser());
      try {
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailcontrollerlog.text.trim(),
                password: passwordcontrollerlog.text.trim());
        final User user = userCredential.user!;
        print("done 1 ");
        if (user.emailVerified) {
          emit(LoginSuccess());
          print("done 2");
        } else {
          emit(EmailNotVerified());

          await user.sendEmailVerification();
          emit(NavigateToOtpPage(user));
        }
            } catch (e) {
        return;
      }
    }
  }

  _resendEmailButtonPressed(
      ResendEmailFromLogin event, Emitter<LoginState> emit) {
    (state as NavigateToOtpPage).user.sendEmailVerification();
  }

  _verifyEmailPressed(LoginEvent event, Emitter<LoginState> emit) {
    final user = (state as NavigateToOtpPage).user;
    emit(LoginstateLogin());
    if (user.emailVerified) {
      emit(LoginSuccess());
    } else {
      emit(EmailVerificationFailedFromOtpPage());
    }
  }
}
