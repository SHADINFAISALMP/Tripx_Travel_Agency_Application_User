// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/models/user_models.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdateProfile>(_profileUpdateing);
  }

  _profileUpdateing(UpdateProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(Profileloading());
      if (!isValidEmail(event.newEmail)) {
        emit(ProfileEror("invalid email format"));
        return;
      }
      final String profileimageUrl = await _getProfileImageUrl(event.useremail);

      final updateduser = UserModel(
          name: event.newName,
          email: event.newEmail,
          phonenumber: event.newPhonenumber,
          password: event.newPassword,
          confirmpassword: event.newPassword,
          imagepath: profileimageUrl);
      await AddUserDetailsToFirebase()
          .updateUserData(updateduser, event.useremail);
      emit(Profileupdated());
    } catch (e) {
      emit(ProfileEror("failed to upload profile $e"));
    }
  }

  Future<String> _getProfileImageUrl(String userEmail) async {
    try {
      final userDoc = await userDetails.doc(userEmail).get();
      final userData = userDoc.data() as Map<String, dynamic>;
      return userData[
          'imagePath']; 
    } catch (e) {
      print("Error getting profile image URL: $e");
      return ''; 
    }
  }
}

bool isValidEmail(String email) {
  final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailPattern.hasMatch(email);
}

class AddUserDetailsToFirebase {
  Future<bool> updateUserData(UserModel updatedUser, String userEmail) async {
    try {
      final data = updatedUser.toMap();
      final userDoc =
          FirebaseFirestore.instance.collection('userdetails').doc(userEmail);
      final userDocSnapshot = await userDoc.get();

      if (userDocSnapshot.exists) {
        await userDoc.update(data);
      } else {
        await userDoc.set(data);
      }
      return true;
    } catch (e) {
      print("Error updating user data: $e");
      return false;
    }
  }
}
