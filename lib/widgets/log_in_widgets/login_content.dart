import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/utils/textformfields.dart';
import 'package:tripx_user_application/widgets/log_in_widgets/donthave_account.dart';
import 'package:tripx_user_application/widgets/log_in_widgets/google_sign.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

class Logincontent extends StatelessWidget {
  const Logincontent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Airplane.jpg'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaqueryheight(.026, context),
                  ),
                  child: mytext(
                    "TRIPX",
                    fontFamily: 'sedan',
                    fontSize: mediaqueryheight(.05, context),
                    color: white70,
                  ),
                ),
                mytext(
                  "WELCOME AGAIN",
                  color: white70,
                  fontFamily: 'sedan',
                  fontSize: mediaqueryheight(.03, context),
                ),
                SizedBox(
                  height: mediaqueryheight(.16, context),
                ),
                const GoogleSignIn(),
                SizedBox(
                  height: mediaqueryheight(.021, context),
                ),
                mytext("------------------OR------------------",
                    fontSize: mediaqueryheight(.031, context),
                    color: white70,
                    fontFamily: sedan),
                SizedBox(
                  height: mediaqueryheight(.031, context),
                ),
                customtextformfieild(
                    "Enter your Email", Icons.email, context,
                    controller: emailcontrollerlog,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: emailValidator),
                SizedBox(
                  height: mediaqueryheight(.05, context),
                ),
                customtextformfiledpassword('Enter Your Password', context,
                    controller: passwordcontrollerlog,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: passwordValidator),
                SizedBox(
                  height: mediaqueryheight(.05, context),
                ),
                Container(
                  height: mediaqueryheight(.07, context),
                  width: mediaquerywidht(.4, context),
                  decoration: BoxDecoration(
                    color: white70,
                    borderRadius: BorderRadius.circular(
                      mediaqueryheight(.011, context),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<LoginBloc>().add(LoginEventButton());
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
                        mytext('Log in',
                            color: black54,
                            fontSize: mediaqueryheight(.029, context),
                            fontWeight: FontWeight.normal,
                            fontFamily: sedan),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(.1, context),
                ),
                const DontHaveAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
