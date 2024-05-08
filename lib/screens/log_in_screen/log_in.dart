import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/google_sign/google_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';

import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/screens/log_in_screen/donthave_account.dart';
import 'package:tripx_user_application/screens/log_in_screen/google_sign.dart';
import 'package:tripx_user_application/screens/otp_verificaation/otp_verification.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/loading_indicator.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/utils/textformfields.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Bottomnavigation()));
              }
              if (state is IncorrectDetails) {
                emailcontrollerlog.clear();
                passwordcontrollerlog.clear();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("incorrect email or password")));
                Navigator.pop(context);
              }
              if (state is EmailNotVerified) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("please verify your email")));
              }
              if (state is NavigateToOtpPage) {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OtpVerification(
                          fromlogin: true,
                        )));
              }
              if (state is AuthenicatingUser) {
                DialogUtils.showLoadingDialog(context);
              }
            },
          ),
          BlocListener<GoogleBloc, GoogleState>(
            listener: (context, state) {
              if (state is GoogleSuccessState) {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Bottomnavigation()));
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Google Sign In Success")));
              }
              if (state is GoogleLoadingstate) {
                DialogUtils.showLoadingDialog(context);
              }
              if (state is GoogleFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Failed Logging in. Please try again")));
                Navigator.pop(context);
              }
            },
          )
        ],
        child: Container(
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
                          () {
                            context.read<LoginBloc>().add(LoginEventButton());
                            return null;
                          }();
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
        ),
      ),
    );
  }
}
