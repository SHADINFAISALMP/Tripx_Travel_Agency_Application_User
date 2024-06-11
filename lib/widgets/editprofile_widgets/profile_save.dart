// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/data_provider/add_image_to_firebase.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/Userprofile_service.dart.dart';

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
                color: whitecolor,
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

        final currentUserDoc =
            await UserProfileService.getUserProfileData(userEmail!);

        await currentUserDoc.reference.update(updatedData);

        if (BlocProvider.of<ProfileimageBloc>(context).state.imageInBytes !=
            null) {
          final url =
              await Addimagetofirebase().addprofileimagetofirebase(context);
          await currentUserDoc.reference.update({"imagepath": url});
        }

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: orangecolor,
              content: Center(
                child: Text(
                  'Profile updated successfully',
                  style: TextStyle(color: whitecolor),
                ),
              )),
        );
        Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: orangecolor,
              content: Text(
                'Failed to update profile: $e',
                style: const TextStyle(color: whitecolor),
              )),
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(1, 5),
            ),
          ],
          color: orangecolor,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: mytext("Save",
            fontFamily: sedan,
            fontSize: 26,
            color: whitecolor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
