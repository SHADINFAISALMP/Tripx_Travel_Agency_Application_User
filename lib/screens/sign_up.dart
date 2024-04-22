import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  XFile? imageFile; // Initialize with null

  Future<void> openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = pickedImage;
      });
    }
  }

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
                      onTap: () => openGallery(context),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: imageFile != null
                            ? FileImage(File(imageFile!.path)) as ImageProvider
                            : const AssetImage("assets/images/Airplane.jpeg"),
                      ),
                    ),
                    Positioned(
                      right: 0, bottom: 1, // Adjust position as needed
                      child: GestureDetector(
                        onTap: () {
                          openGallery(context);
                        },
                        child: CircleAvatar(
                          radius: mediaqueryheight(0.029, context),
                          backgroundColor: colorteal, // Change color as needed
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
                customtextformfieild('Enter Your Name', Icons.person, context),
                SizedBox(
                  height: mediaqueryheight(.020, context),
                ),
                customtextformfieild("Enter Your Email", Icons.email, context),
                SizedBox(
                  height: mediaqueryheight(.020, context),
                ),
                const Textformfieldphonenumber(),
                SizedBox(
                  height: mediaqueryheight(.01, context),
                ),
                customtextformfiledpassword("Enter Your Password", context),
                SizedBox(
                  height: mediaqueryheight(.01, context),
                ),
                customtextformfiledpassword("Confirm Password", context),
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OtpVerification())),
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
    );
  }
}
