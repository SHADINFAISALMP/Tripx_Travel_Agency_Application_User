import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/google_sign/google_bloc.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          context.read<GoogleBloc>().add(Googlepressed());
        },
        child: BlocListener<GoogleBloc, GoogleState>(
          listener: (context, state) {
            if (state is GoogleSuccessState) {
              final String email = state.user.email!;
              final String name = state.user.displayName ?? '';
              final String imagepath = state.user.photoURL ?? '';
              final String phonenumber = state.user.phoneNumber ?? '';
              const String password = '';
              const String confirmpassword = '';
              updateUserProfile(email, name, imagepath, phonenumber, password,
                  confirmpassword);
            }
          },
          child: Container(
            height: mediaqueryheight(.07, context),
            width: mediaquerywidht(.9, context),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.all(Radius.circular(
                mediaqueryheight(.011, context),
              )),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: mediaquerywidht(.07, context),
                  ),
                  child: Image.asset(
                    "assets/images/google.png",
                    height: mediaqueryheight(.05, context),
                  ),
                ),
                SizedBox(
                  width: mediaquerywidht(.06, context),
                ),
                mytext(
                  "Sign In With Google",
                  color: blackcolor,
                  fontFamily: sedan,
                  fontWeight: FontWeight.w700,
                  fontSize: mediaqueryheight(.021, context),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> updateUserProfile(String email, String name, String imagepath,
      String phonenumber, String password, String confirmpassword) async {
    debugPrint("hppoooii ");
    try {
      final userProfileSnapshot =
          await userDetails.where('email', isEqualTo: email).get();

      if (userProfileSnapshot.docs.isNotEmpty) {
        final userProfileDoc = userProfileSnapshot.docs.first;
        await userProfileDoc.reference.update({
          'phonenumber': phonenumber,
          'imagepath': imagepath,
          'name': name,
          'email': email,
          'password': password,
          'confirmpassword': confirmpassword
        });
      } else {
        debugPrint("hppoooii2 ");
        await userDetails.doc().set({
          'email': email,
          'phonenumber': phonenumber,
          'imagepath': imagepath,
          'name': name,
          'password': password,
          'confirmpassword': confirmpassword
        });
      }
    } catch (error) {
      debugPrint("Error updating user profile: $error");
    }
  }
}
