import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/google_sign/google_bloc.dart';
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
      onTap: () {
        context.read<GoogleBloc>().add(Googlepressed());
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
    );
  }
}
