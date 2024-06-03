import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/profile/profile_bloc.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
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
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newPhonenumber = _phoneController.text;
    String newPassword = _passwordController.text;

    context.read<ProfileBloc>().add(UpdateProfile(
        newName: newName,
        newEmail: newEmail,
        newPhonenumber: newPhonenumber,
        newPassword: newPassword));
    debugPrint("User Email: $userEmail");
   
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
