import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/firebase_auth/firebase_services.dart';
import 'package:tripx_user_application/repository/user_registration.dart';
import 'package:tripx_user_application/screens/signup_page/sign_up.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<Confirmpassword>(_confirmPassword);
    on<Signupbuttonpress>(_signupbuttonpress);
    on<AuthenticateUserDetails>(_authenticateUserDetails);
    on<ResendEmailButtonPressed>(_resendEmailButtonPressed);
    on<VerifyEmailPressed>(_verifyEmailPressed);
  }
  _signupbuttonpress(
    Signupbuttonpress event,
    Emitter<SignupState> emit,
  ) async {
    // print(" reached");

    if (formKeyy.currentState != null && formKeyy.currentState!.validate()) {
      if (BlocProvider.of<ProfileimageBloc>(event.context, listen: false)
              .state
              .imageInBytes !=
          null) {
        emit(AuthLoading());
        add(AuthenticateUserDetails(event.context));
      } else {
        return;
      }
    }
  }

  _authenticateUserDetails(
      AuthenticateUserDetails event, Emitter<SignupState> emit) async {
    try {
      FirebaseAuthServices auth = FirebaseAuthServices();
      User? user = await auth.signUpWithEmailandPassword();
      if (user != null) {
        print("mownee");
        await AddUserDetailsToFirebase().addDataToFirebase(event.context);
        print("edaa ");
        FirebaseAuth authenctication = FirebaseAuth.instance;
        authenctication.currentUser!.sendEmailVerification();
        emit(NavigateToEmailVerficationPage());
      } else {
        emit(Registerfail("email already exists"));
      }
    } catch (e) {
      emit(Registerfail("something went wrong"));
    }
  }

  _resendEmailButtonPressed(
      ResendEmailButtonPressed event, Emitter<SignupState> emit) {
    try {
      FirebaseAuth authentication = FirebaseAuth.instance;
      authentication.currentUser!.sendEmailVerification();
    } catch (e) {
      emit(Registerfail("some Things went wrong"));
    }
  }

  _verifyEmailPressed(
      VerifyEmailPressed event, Emitter<SignupState> emit) async {
    emit(LoadingStateOtpScreen());
    try {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        emit(NavigateHomePage());
        print("success");
      }
    } catch (e) {
      emit(Registerfail("PLease Try Again"));
    }
  }

  void _confirmPassword(Confirmpassword event, Emitter<SignupState> emit) {
    emit(ConfirmPasswordState(
      isConfirmed: event.isconfirmpassword,
    ));
  }
}
