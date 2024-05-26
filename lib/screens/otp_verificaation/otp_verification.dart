import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/widgets/otp_widgets/resend_email.dart';
import 'package:tripx_user_application/widgets/otp_widgets/submit_botton.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

class OtpVerification extends StatelessWidget {
  final bool fromlogin;
  const OtpVerification(
      {super.key, required this.fromlogin, required String email});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is NavigateHomePage) {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Bottomnavigation()));
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Login Success")));
            }
            if (state is Registerfail) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("failed")));
              Navigator.pop(context);
            }
            if (state is LoadingStateOtpScreen) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Image.asset(
                              'assets/images/circle.gif',
                              color: whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is NavigateHomePage) {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Bottomnavigation()));
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Login Success")));
            }
            if (state is LoadingStateLogin) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Image.asset(
                              'assets/images/circle.gif',
                              color: whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        )
      ],
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Airplane.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: mediaqueryheight(.05, context),
                    ),
                    child: mytext(
                      "Please Verify your Email",
                      fontFamily: 'sedan',
                      fontSize: mediaqueryheight(.034, context),
                      color: white70,
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(.09, context),
                  ),
                  Text(
                    "we just sent an email to ${emailcontroller.text}.\nClick the link in the email to verify your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'sedan',
                        fontSize: mediaqueryheight(.029, context),
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: mediaqueryheight(.041, context),
                  ),
                  SubmitButtonVerify(
                    fromlogin: fromlogin,
                  ),
                  SizedBox(
                    height: mediaqueryheight(.021, context),
                  ),
                  ResendEmail(
                    fromlogin: fromlogin,
                  ),
                  SizedBox(
                    height: mediaqueryheight(.041, context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
