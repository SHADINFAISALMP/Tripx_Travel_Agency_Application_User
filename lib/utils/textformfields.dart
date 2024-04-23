import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

TextEditingController namecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController confirmpasswordcontroler = TextEditingController();

TextEditingController emailcontrollerlog = TextEditingController();
TextEditingController passwordcontrollerlog = TextEditingController();

SizedBox customtextformfieild(
  String hinttext,
  IconData icon,
  context, {
  required String? Function(String?)? validator,
  required TextEditingController controller,
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
}) {
  return SizedBox(
    width: mediaquerywidht(.9, context),
    child: TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: white70,
        prefixIcon: Icon(icon, color: blackcolor),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: black54,
            fontSize: mediaqueryheight(.021, context),
            fontWeight: FontWeight.w200,
            fontFamily: sedan),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            mediaqueryheight(.011, context),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

customtextformfiledpassword(
  String hinttext,
  context, {
  required String? Function(String?)? validator,
  required TextEditingController controller,
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
}) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      bool isObscured = true;
      if (state is PasswordVisibleState) {
        isObscured = state.isVisible;
      }
      return SizedBox(
        width: mediaquerywidht(.9, context),
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          validator: validator,
          controller: controller,
          maxLength: 6,
          obscureText: isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: white70,
            prefixIcon: const Icon(Icons.password_sharp, color: blackcolor),
            suffixIcon: GestureDetector(
              onTap: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(Togglepasswordviiblity(isVisible: !isObscured));
              },
              child: Icon(
                !isObscured ? Icons.visibility : Icons.visibility_off,
                color: black87,
              ),
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
                color: black54,
                fontSize: mediaqueryheight(.021, context),
                fontWeight: FontWeight.normal,
                fontFamily: sedan),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                mediaqueryheight(.011, context),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
    },
  );
}
customtextformfiledconfirmpassword(
  String hinttext,
  context, {
  required String? Function(String?)? validator,
  required TextEditingController controller,
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
}) {
  return BlocBuilder<SignupBloc, SignupState>(
    builder: (context, state) {
      bool isObscured = true;
      if (state is ConfirmPasswordState) {
        isObscured = state.isConfirmed;
      }
      return SizedBox(
        width: mediaquerywidht(.9, context),
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          validator: validator,
          controller: controller,
          maxLength: 6,
          obscureText: isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: white70,
            prefixIcon: const Icon(Icons.password_sharp, color: blackcolor),
            suffixIcon: GestureDetector(
              onTap: () {
                 BlocProvider.of<SignupBloc>(context)
                    .add(Confirmpassword(isconfirmpassword: !isObscured));
              },
              child: Icon(
                !isObscured ? Icons.visibility : Icons.visibility_off,
                color: black87,
              ),
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
                color: black54,
                fontSize: mediaqueryheight(.021, context),
                fontWeight: FontWeight.normal,
                fontFamily: sedan),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                mediaqueryheight(.011, context),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
    },
  );
}
class Textformfieldphonenumber extends StatelessWidget {
  const Textformfieldphonenumber(
      {Key? key,
      required this.validator,
      this.autovalidateMode = AutovalidateMode.disabled,
      required TextEditingController controller})
      : super(key: key);

  final String? Function(String?) validator;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaquerywidht(.9, context),
      child: TextFormField(
        controller: phonecontroller,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        autovalidateMode: autovalidateMode,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: white70,
          prefixIcon: const Icon(Icons.phone, color: blackcolor),
          hintText: 'Enter your phone number',
          hintStyle: TextStyle(
            color: black54,
            fontSize: mediaqueryheight(.021, context),
            fontWeight: FontWeight.normal,
            fontFamily: sedan,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              mediaqueryheight(.011, context),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
