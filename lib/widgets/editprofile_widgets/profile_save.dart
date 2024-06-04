// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/profile/profile_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Editprofilesavebutton extends StatelessWidget {
  const Editprofilesavebutton({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneController = phoneController,
        _passwordController = passwordController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    void updateUserDetails() async {
      try {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: colorteal,
                size: 60,
              ),
            );
          },
        );

        String newName = _nameController.text;
        String newEmail = _emailController.text;

        String newPhonenumber = _phoneController.text;
        String newPassword = _passwordController.text;

        if (!isValidEmail(newEmail)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email format')),
          );
          return;
        }

        final Map<String, dynamic> updatedData = {
          'name': newName,
          'email': newEmail,
          'phonenumber': newPhonenumber,
          'password': newPassword,
        };

        final userDoc =
            FirebaseFirestore.instance.collection('userdetails').doc(newEmail);
        await userDoc.update(updatedData);

        Navigator.pop(context); // Dismiss the loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.pop(context); // Close the edit profile screen
      } catch (e) {
        Navigator.pop(context); // Dismiss the loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $e')),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        updateUserDetails();
      },
      child: Container(
        height: mediaqueryheight(0.07, context),
        width: mediaquerywidht(0.5, context),
        decoration: BoxDecoration(
            color: orangecolor, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child:
            mytext("Save", fontFamily: sedan, fontSize: 26, color: whitecolor),
      ),
    );
  }
}
