import 'package:bloc/bloc.dart';
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
      final String profileimageUrl = await _getProfileImageUrl();

      final updateduser = UserModel(
          name: event.newName,
          email: event.newEmail,
          phonenumber: event.newPhonenumber,
          password: event.newPassword,
          confirmpassword: event.newPassword,
          imagepath: profileimageUrl);
      await AddUserDetailsToFirebase().updateUserData(updateduser);
      emit(Profileupdated());
    } catch (e) {
      emit(ProfileEror("failed to upload profile $e"));
    }
  }

  Future<String> _getProfileImageUrl() async {
    // Implement this method to get the current user's profile image URL
    // You can replace it with your actual implementation
    return ''; // Return a placeholder for demonstration
  }
}

bool isValidEmail(String email) {
  final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailPattern.hasMatch(email);
}

class AddUserDetailsToFirebase {
  Future<void> updateUserData(UserModel updatedUser) async {
    try {
      final data = updatedUser.toMap();
      final userDoc = userDetails.doc(updatedUser.email);
      final userDocSnapshot = await userDoc.get();

      if (userDocSnapshot.exists) {
        await userDoc.update(data);
      } else {
        // Create a new document with the provided email
        await userDoc.set(data);
      }
    } catch (e) {
      throw Exception("Error updating user data: $e");
    }
  }
}
