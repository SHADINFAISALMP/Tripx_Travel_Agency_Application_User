import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/editprofile_widgets/editprofile_content.dart';

class Editprofile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String imagePath;
  const Editprofile(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.imagePath});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  late Future<DocumentSnapshot> _userprofile;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  XFile? imageFile;
  @override
  void initState() {
    super.initState();
    _userprofile = getUserProfileData();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phoneNumber);
    _passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<DocumentSnapshot> getUserProfileData() async {
    final userProfileSnapshot =
        await userDetails.where('email', isEqualTo: userEmail).get();
    if (userProfileSnapshot.docs.isEmpty) {
      // ignore: null_check_always_fails
      return null!;
    } else {
      return userProfileSnapshot.docs.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: whitecolor,
        ),
        centerTitle: true,
        backgroundColor: colorteal,
        title: mytext("Edit Profile",
            fontFamily: sedan,
            fontSize: mediaqueryheight(0.029, context),
            color: whitecolor),
      ),
      body: FutureBuilder(
        future: _userprofile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: whitecolor, size: 60),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available');
          } else {
            final userProfile = snapshot.data!.data() as Map<String, dynamic>;
            _nameController.text = userProfile['name'];
            _emailController.text = userProfile['email'];
            _phoneController.text = userProfile['phonenumber'];
            _passwordController.text = userProfile['password'];
            return SingleChildScrollView(
              child: Center(
                child: Editprofilecontent(
                    userProfile: userProfile,
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    passwordController: _passwordController),
              ),
            );
          }
        },
      ),
    );
  }
}
