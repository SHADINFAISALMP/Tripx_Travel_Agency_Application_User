import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/utils/textformfields.dart';
import 'package:tripx_user_application/widgets/signup_widgets/aignup_buttom.dart';
import 'package:tripx_user_application/widgets/signup_widgets/create_account_image.dart';
import 'package:tripx_user_application/widgets/signup_widgets/heading_welcome.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

class Signuppagecontent extends StatelessWidget {
  const Signuppagecontent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingWelcom(),
        SizedBox(
          height: mediaqueryheight(.011, context),
        ),
        const Stack(
          alignment: Alignment.center,
          children: [
            CreateAccountImage(),
            CameraButton(),
          ],
        ),
        SizedBox(height: mediaqueryheight(0.010, context)),
        mytext(
          "CREATE AN ACCOUNT",
          fontSize: mediaqueryheight(.030, context),
          color: white70,
          fontFamily: 'sedan',
        ),
        SizedBox(
          height: mediaqueryheight(.011, context),
        ),
        customtextformfieild(
          'Enter Your Name',
          Icons.person,
          context,
          controller: namecontroller,
          validator: nameValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(
          height: mediaqueryheight(.015, context),
        ),
        customtextformfieild(
          "Enter Your Email",
          Icons.email,
          context,
          validator: emailValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: emailcontroller,
        ),
        SizedBox(
          height: mediaqueryheight(.015, context),
        ),
        Textformfieldphonenumber(
          validator: phoneValidator,
          controller: phonecontroller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        customtextformfiledpassword(
          "Enter Your Password",
          context,
          controller: passwordcontroller,
          validator: passwordValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        customtextformfiledconfirmpassword(
          "Confirm Password",
          context,
          controller: confirmpasswordcontroler,
          validator: confirmPasswordValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(
          height: mediaqueryheight(.011, context),
        ),
        const SignUpButton(),
      ],
    );
  }
}
