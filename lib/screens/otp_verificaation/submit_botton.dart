import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class SubmitButtonVerify extends StatelessWidget {
  final bool fromlogin;
  const SubmitButtonVerify({
    super.key,
    required this.fromlogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(.061, context),
      width: mediaquerywidht(.7, context),
      decoration: BoxDecoration(
        color: white70,
        borderRadius: BorderRadius.circular(
          mediaqueryheight(.011, context),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Bottomnavigation()));
          submitButton(context, fromlogin);
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaquerywidht(.03, context),
              ),
            ),
            SizedBox(
              width: mediaquerywidht(.04, context),
            ),
            mytext(
              'VERIFY & CONTINUE',
              color: blackcolor,
              fontSize: mediaqueryheight(.021, context),
              fontWeight: FontWeight.bold,
              fontFamily: 'sedan',
            ),
          ],
        ),
      ),
    );
  }
}

submitButton(BuildContext context, bool fromLogin) {
  fromLogin
      ? context
          .read<SignupBloc>()
          .add(VerifyEmailPressed(context)) //here i changed
      : context.read<SignupBloc>().add(VerifyEmailPressed(context));
  return null;
}
