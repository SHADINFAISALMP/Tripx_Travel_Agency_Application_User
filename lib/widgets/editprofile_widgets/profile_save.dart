// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Editprofilesavebutton extends StatelessWidget {
  const Editprofilesavebutton({
    super.key,
    required TextEditingController nameController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _phoneController = phoneController,
        _passwordController = passwordController;

  final TextEditingController _nameController;
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

        String newPhonenumber = _phoneController.text;
        String newPassword = _passwordController.text;

        final Map<String, dynamic> updatedData = {
          'name': newName,
          'phonenumber': newPhonenumber,
          'password': newPassword,
        };

        final userDoc = FirebaseFirestore.instance
            .collection('userdetails')
            .doc('rgQJjeHxzvWIgKtQ4HXN');
        await userDoc.update(updatedData);

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
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
