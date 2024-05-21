import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/screens/otp_verificaation/otp_verification.dart';
import 'package:tripx_user_application/screens/signup_page/aignup_buttom.dart';
import 'package:tripx_user_application/screens/signup_page/create_account_image.dart';
import 'package:tripx_user_application/screens/signup_page/heading_welcome.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/loading_indicator.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/utils/textformfields.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

final GlobalKey<FormState> formKeyy = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is NavigateToEmailVerficationPage) {
                  userEmail = emailcontroller.text;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => OtpVerification(
                              fromlogin: false,
                              email: userEmail!,
                            )),
                  );
                }
                if (state is Imagenotpicked) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an image'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state is Registerfail) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Email already Exists'),
                    backgroundColor: Colors.red,
                  ));
                }
                if (state is AuthLoading) {
                  DialogUtils.showLoadingDialog(context);
                }
                if (state is Signupsuccess) {
                  userEmail = emailcontroller.text;
                }
              },
              builder: (context, state) {
                return Form(
                  key: formKeyy,
                  child: Column(
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
