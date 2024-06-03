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
    debugPrint("Login button pressed");
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
        debugPrint("Authentication successful");

        if (user.emailVerified) {
          emit(LoginSuccess());
          debugPrint("Email is verified");
        } else {
          emit(EmailNotVerified());
          await user.sendEmailVerification();
          emit(NavigateToOtpPage(user));
          debugPrint("Email verification sent");
        }
      } catch (e) {
        debugPrint("Error during authentication: $e");
        emit(LoginFailure(error: e.toString()));
      }
    } else {
      debugPrint("Form validation failed");
      emit(LoginFailure(error: "Form validation failed"));
    }
  }

  _resendEmailButtonPressed(
      ResendEmailFromLogin event, Emitter<LoginState> emit) async {
    try {
      await (state as NavigateToOtpPage).user.sendEmailVerification();
      debugPrint("Resent email verification");
    } catch (e) {
      debugPrint("Error resending email verification: $e");
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
        debugPrint("Email verified successfully from OTP page");
      } else {
        emit(EmailVerificationFailedFromOtpPage());
        debugPrint("Email verification failed from OTP page");
      }
    } catch (e) {
      debugPrint("Error verifying email: $e");
      emit(LoginFailure(error: e.toString()));
    }
  }
}
