import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class ResendEmail extends StatelessWidget {
  final bool fromlogin;
  const ResendEmail({
    super.key,
    required this.fromlogin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fromlogin
            ? context.read<LoginBloc>().add(ResendEmailFromLogin())
            : context.read<SignupBloc>().add(ResendEmailButtonPressed());
      },
      child: Text(
        "haven't recieved the verification email? \n                      resend email",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: 'sedan',
            fontSize: mediaqueryheight(.021, context),
            color: white70,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
