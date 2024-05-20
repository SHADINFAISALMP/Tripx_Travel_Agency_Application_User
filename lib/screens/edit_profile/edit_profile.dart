import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/profile/profile_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  late Future<DocumentSnapshot> _userprofile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _userprofile = getUserProfileData();
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
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is Profileupdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
          } else if (state is ProfileEror) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: FutureBuilder(
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      BlocBuilder<ProfileimageBloc, ProfileimageState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<ProfileimageBloc>()
                                  .add(Imagepress());
                            },
                            child: CircleAvatar(
                              radius: 90.0,
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Opacity(
                                    opacity: 0.999,
                                    child: CircleAvatar(
                                      radius: 90.0,
                                      backgroundImage: state.imageInBytes !=
                                              null
                                          ? MemoryImage(state.imageInBytes!)
                                              as ImageProvider
                                          : NetworkImage(
                                              "${userProfile['imagepath']}"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ProfileimageBloc>()
                                          .add(Imagepress());
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: whitecolor,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.05, context),
                      ),
                      ProfileTextField(
                        prefixIcon: Icons.person,
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.03, context),
                      ),
                      ProfileTextField(
                        prefixIcon: Icons.mail,
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.03, context),
                      ),
                      ProfileTextField(
                        prefixIcon: Icons.phone,
                        controller: _phoneController,
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.03, context),
                      ),
                      ProfileTextField(
                        prefixIcon: Icons.password,
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.03, context),
                      ),
                      GestureDetector(
                        onTap: () {
                          updateUserDetails();
                        },
                        child: Container(
                          height: mediaqueryheight(0.07, context),
                          width: mediaquerywidht(0.5, context),
                          decoration: BoxDecoration(
                              color: orangecolor,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: mytext("Save",
                              fontFamily: sedan,
                              fontSize: 26,
                              color: whitecolor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void updateUserDetails() async {
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newPhonenumber = _phoneController.text;
    String newPassword = _passwordController.text;

    context.read<ProfileBloc>().add(UpdateProfile(
        newName: newName,
        newEmail: newEmail,
        newPhonenumber: newPhonenumber,
        newPassword: newPassword));
    print("User Email: $userEmail");
    // Optionally, you can display a success message or navigate to another screen.
  }
}

class ProfileTextField extends StatelessWidget {
  final IconData prefixIcon;

  final TextEditingController controller;

  const ProfileTextField({super.key, 
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaquerywidht(0.9, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            height: mediaqueryheight(0.003, context),
            color: colorteal,
            backgroundColor: whitecolor,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            prefixIconColor: colorteal,
            fillColor: whitecolor,
            filled: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
