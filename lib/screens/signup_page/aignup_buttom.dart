

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/screens/signup_page/sign_up.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(.07, context),
      width: mediaquerywidht(.5, context),
      decoration: BoxDecoration(
        color: white70,
        borderRadius: BorderRadius.circular(
          mediaqueryheight(.011, context),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          if (formKeyy.currentState!.validate()) {
           
            context
                .read<SignupBloc>()
                .add(Signupbuttonpress(context));
          }
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaquerywidht(.03, context),
              ),
              child: const Icon(Icons.login, color: blackcolor),
            ),
            SizedBox(
              width: mediaquerywidht(.04, context),
            ),
            mytext(
              'Sign Up',
              color: black54,
              fontSize: mediaqueryheight(.021, context),
              fontWeight: FontWeight.normal,
              fontFamily: 'sedan',
            ),
          ],
        ),
      ),
    );
  }
}