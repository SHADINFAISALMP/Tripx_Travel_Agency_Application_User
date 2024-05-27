import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/google_sign/google_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';
import 'package:tripx_user_application/screens/bottom_navigation/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/loading_indicator.dart';
import 'package:tripx_user_application/widgets/log_in_widgets/login_content.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

String? userEmail;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailcontrollerlog.clear();
      passwordcontrollerlog.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                userEmail = emailcontrollerlog.text;
                Navigator.pop(context);
                DialogUtils.showLoadingDialog(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Bottomnavigation()));
              } else if (state is IncorrectDetails) {
                emailcontrollerlog.clear();
                passwordcontrollerlog.clear();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("incorrect email or password")));
                Navigator.pop(context);
              }
              // else if (state is EmailNotVerified) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text("please verify your email")));
              // }
              //  else if (state is NavigateToOtpPage) {
              //   Navigator.pop(context);
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => OtpVerification(
              //             fromlogin: true,
              //             email: userEmail!,
              //           )));
              // }
              else if (state is AuthenicatingUser) {
                DialogUtils.showLoadingDialog(context);
              }
            },
          ),
          BlocListener<GoogleBloc, GoogleState>(
            listener: (context, state) {
              if (state is GoogleSuccessState) {
                userEmail = state.user.email;
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Bottomnavigation()));
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Google Sign In Success")));
              }
              if (state is GoogleLoadingstate) {
                Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                      color: whitecolor, size: 60),
                );
              }
              if (state is GoogleFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Failed Logging in. Please try again")));
                Navigator.pop(context);
              }
            },
          )
        ],
        child: const Logincontent(),
      ),
    );
  }
}
