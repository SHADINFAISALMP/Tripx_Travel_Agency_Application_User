import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/editprofile_widgets/profile_save.dart';
import 'package:tripx_user_application/widgets/editprofile_widgets/profiletextfield.dart';

class Editprofilecontent extends StatelessWidget {
  const Editprofilecontent({
    super.key,
    required this.userProfile,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
  }) : _nameController = nameController, _emailController = emailController, _phoneController = phoneController, _passwordController = passwordController;

  final Map<String, dynamic> userProfile;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Editprofilesavebutton(nameController: _nameController, emailController: _emailController, phoneController: _phoneController, passwordController: _passwordController),
      ],
    );
  }
}

