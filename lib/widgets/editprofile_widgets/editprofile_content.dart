import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/editprofile_widgets/profile_save.dart';

class Editprofilecontent extends StatelessWidget {
  const Editprofilecontent({
    super.key,
    required this.userProfile,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneController = phoneController,
        _passwordController = passwordController;

  final Map<String, dynamic> userProfile;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
     Widget buildTextField({
      required TextEditingController controller,
      required String hintText,
      required IconData icon,
    }) {
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
              hintText: hintText,
              prefixIcon: Icon(icon),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        BlocBuilder<ProfileimageBloc, ProfileimageState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<ProfileimageBloc>().add(Imagepress());
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
                        backgroundImage: state.imageInBytes != null
                            ? MemoryImage(state.imageInBytes!) as ImageProvider
                            : NetworkImage("${userProfile['imagepath']}"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ProfileimageBloc>().add(Imagepress());
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
         buildTextField(
            controller: _nameController,
            hintText: 'Enter Your Name',
            icon: Icons.person),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        buildTextField(
            controller: _emailController,
            hintText: 'Enter Your Email',
            icon: Icons.mail),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        buildTextField(
            controller: _phoneController,
            hintText: 'Enter Your Phone number',
            icon: Icons.phone),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
       buildTextField(
            controller: _passwordController,
            hintText: 'Enter Your Place',
            icon: Icons.place),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        Editprofilesavebutton(
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            passwordController: _passwordController),
      ],
    );
  }
}
