import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:tripx_user_application/screens/otp_verification.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/utils/textformfields.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Uint8List? imageinbytes;
  String? imagepath;
  String? imageValidationError;

  Future<String?> addUserDetails(String url) async {
    try {
      await FirebaseFirestore.instance.collection('userdetails').add({
        'name': namecontroller.text.trim(),
        'email': emailcontroller.text.trim(),
        'phonenumber': phonecontroller.text.trim(),
        'password': passwordcontroller.text.trim(),
        'confirmpassword': confirmpasswordcontroler.text.trim(),
        'image': url
      });
    } catch (e) {}
    return null;
  }

  Future<String?> uploadimage(Uint8List imgbyts, String filename) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('Userimages')
          .child(filename);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await ref.putData(imgbyts, meta);
      String url = await ref.getDownloadURL();

      return url;
    } catch (e) {
      return null;
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      final img = await file.readAsBytes();
      setState(() {
        imagepath = file.name;
        imageinbytes = img;
      });
      return await file.readAsBytes();
    }
    print("No image selected");
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (imageinbytes != null) {
        final url = await uploadimage(imageinbytes!, imagepath!);
        await addUserDetails(url!);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OtpVerification()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select an image'),
            backgroundColor: Colors.red,
          ),
        );
      }
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
                        onTap: () => pickImage(ImageSource.gallery),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: imagepath != null
                              ? MemoryImage(imageinbytes!) as ImageProvider
                              : const AssetImage("assets/images/Airplane.jpeg"),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 1,
                        child: GestureDetector(
                          onTap: () {
                            // context.read<SignupBloc>().add(Imagebuttonpress());
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
    );
  }
}
