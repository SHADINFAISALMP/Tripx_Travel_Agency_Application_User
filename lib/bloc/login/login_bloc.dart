import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    print("Login button pressed");
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      userEmail = emailcontrollerlog.text;

      emit(AuthenicatingUser());
      try {
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailcontrollerlog.text.trim(),
                password: passwordcontrollerlog.text.trim());
        final User user = userCredential.user!;
        print("Authentication successful");

        if (user.emailVerified) {
          emit(LoginSuccess());
          print("Email is verified");
        } else {
          emit(EmailNotVerified());
          await user.sendEmailVerification();
          emit(NavigateToOtpPage(user));
          print("Email verification sent");
        }
      } catch (e) {
        print("Error during authentication: $e");
        emit(LoginFailure(error: e.toString()));
      }
    } else {
      print("Form validation failed");
      emit(LoginFailure(error: "Form validation failed"));
    }
  }

  _resendEmailButtonPressed(
      ResendEmailFromLogin event, Emitter<LoginState> emit) async {
    try {
      await (state as NavigateToOtpPage).user.sendEmailVerification();
      print("Resent email verification");
    } catch (e) {
      print("Error resending email verification: $e");
      emit(LoginFailure(error: e.toString()));
    }
  }

  _verifyEmailPressed(
      Verifyemailpressedfromlogin event, Emitter<LoginState> emit) async {
    final user = (state as NavigateToOtpPage).user;
    try {
      await user.reload();
      if (user.emailVerified) {
        emit(LoginSuccess());
        print("Email verified successfully from OTP page");
      } else {
        emit(EmailVerificationFailedFromOtpPage());
        print("Email verification failed from OTP page");
      }
    } catch (e) {
      print("Error verifying email: $e");
      emit(LoginFailure(error: e.toString()));
    }
  }
}
