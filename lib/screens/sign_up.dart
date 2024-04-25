import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';

import 'package:tripx_user_application/screens/otp_verification.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
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
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is Signupsuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const OtpVerification()),
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
      },
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
              child: Form(
                key: formKeyy,
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
                        BlocBuilder<ProfileimageBloc, ProfileimageState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<ProfileimageBloc>()
                                    .add(Imagepress());
                              },
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: state.imageInBytes != null
                                    ? MemoryImage(state.imageInBytes!)
                                        as ImageProvider
                                    : const AssetImage(
                                        "assets/images/Airplane.jpeg"),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          right: 0,
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<ProfileimageBloc>()
                                  .add(Imagepress());
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
                        onTap: () {
                          if (formKeyy.currentState!.validate()) {
                           
                            context
                                .read<SignupBloc>()
                                .add(Signupbuttonpress(context));
                          }
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
                            mytext(
                              'Sign Up',
                              color: black54,
                              fontSize: mediaqueryheight(.021, context),
                              fontWeight: FontWeight.normal,
                              fontFamily: 'sedan',
                            ),
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
      ),
    );
  }
}
