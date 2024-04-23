import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/screens/otp_verification.dart';

import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/utils/textformfields.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: mediaqueryheight(.051, context),
                    ),
                    child: mytext(
                      "WELCOME",
                      color: Colors.white70,
                      fontFamily: 'sedan',
                      fontSize: mediaqueryheight(.030, context),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(.011, context),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.read<SignupBloc>().add(Imagebuttonpress()),
                        child: BlocBuilder<SignupBloc, SignupState>(
                          builder: (context, state) {
                            return CircleAvatar(
                              radius: 100,
                              backgroundImage: state.imagepath.isNotEmpty
                                  ? FileImage(File(state.imagepath))
                                      as ImageProvider
                                  : const AssetImage(
                                      "assets/images/Airplane.jpeg"),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 1,
                        child: GestureDetector(
                          onTap: () {
                            context.read<SignupBloc>().add(Imagebuttonpress());
                          },
                          child: CircleAvatar(
                            radius: mediaqueryheight(0.029, context),
                            backgroundColor: colorteal,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: mediaqueryheight(0.035, context),
                              color: whitecolor,
                            ),
                          ),
                        ),
                      ),
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
                  customtextformfieild('Enter Your Name', Icons.person, context,
                      controller: namecontroller,
                      validator: namevalidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                  SizedBox(
                    height: mediaqueryheight(.015, context),
                  ),
                  customtextformfieild("Enter Your Email", Icons.email, context,
                      validator: emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailcontroller),
                  SizedBox(
                    height: mediaqueryheight(.015, context),
                  ),
                  Textformfieldphonenumber(
                      validator: phoneValidator,
                      controller: phonecontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                  customtextformfiledpassword("Enter Your Password", context,
                      controller: passwordcontroller,
                      validator: passwordvalidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                  customtextformfiledconfirmpassword(
                      "Confirm Password", context,
                      controller: confirmpasswordcontroler,
                      validator: confirmPasswordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                  SizedBox(
                    height: mediaqueryheight(.011, context),
                  ),
                  Container(
                    height: mediaqueryheight(.07, context),
                    width: mediaquerywidht(.5, context),
                    decoration: BoxDecoration(
                      color: white70,
                      borderRadius: BorderRadius.circular(
                        mediaqueryheight(.011, context),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => _submitForm(),
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
                          mytext('Sign Up',
                              color: black54,
                              fontSize: mediaqueryheight(.021, context),
                              fontWeight: FontWeight.normal,
                              fontFamily: 'sedan'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (context.read<SignupBloc>().state.imagepath.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select an image'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const OtpVerification()));
      }
    }
  }
}

String? confirmPasswordValidator(
  String? value,
) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != passwordcontroller.text) {
    return 'Passwords do not match';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!value.contains('@')) {
    return 'Email must contain "@" symbol';
  }
  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? namevalidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegExp.hasMatch(value)) {
    return 'Please enter a valid name';
  }
  return null;
}

String? passwordvalidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must contain at least 6 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }
  // Check if the input consists of exactly 10 digits
  if (value.length != 10 || int.tryParse(value) == null) {
    return 'Phone number must be 10 digits';
  }
  return null;
}
