import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/screens/otp_verificaation/otp_verification.dart';
import 'package:tripx_user_application/utils/loading_indicator.dart';
import 'package:tripx_user_application/widgets/signup_widgets/signup_content.dart';
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
                  child: const Signuppagecontent(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

