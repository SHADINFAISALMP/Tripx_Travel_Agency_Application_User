import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/screens/sign_up.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<Confirmpassword>(_confirmPassword);
    on<Signupbuttonpress>(_signupbuttonpress);
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
        
        emit(AddingToDataToFirebase());
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('Userimages').child(
                BlocProvider.of<ProfileimageBloc>(event.context, listen: false)
                    .state
                    .imagepath);
        final meta =
            firebase_storage.SettableMetadata(contentType: "image/jpeg");
        await ref.putData(
            BlocProvider.of<ProfileimageBloc>(event.context, listen: false)
                .state
                .imageInBytes!,
            meta);
        String url = await ref.getDownloadURL();

        try {
          await FirebaseFirestore.instance.collection('userdetails').add({
            'name': namecontroller.text.trim(),
            'email': emailcontroller.text.trim(),
            'phonenumber': phonecontroller.text.trim(),
            'password': passwordcontroller.text.trim(),
            'confirmpassword': confirmpasswordcontroler.text.trim(),
            'image': url
          });
          emit(Signupsuccess());
        } catch (e) {
         
          emit(Signupfailure());
        }
      } else {
        emit(Imagenotpicked());
      }
    } else {
      return;
    }
  }

  void _confirmPassword(Confirmpassword event, Emitter<SignupState> emit) {
    emit(ConfirmPasswordState(
      isConfirmed: event.isconfirmpassword,
    ));
   
  }
}
