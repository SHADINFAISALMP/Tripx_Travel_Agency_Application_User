import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/editprofile_widgets/profile_save.dart';

class Editprofilecontent extends StatefulWidget {
  const Editprofilecontent({
    super.key,
    required this.userProfile,
  });

  final Map<String, dynamic> userProfile;

  @override
  State<Editprofilecontent> createState() => _EditprofilecontentState();
}

class _EditprofilecontentState extends State<Editprofilecontent> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile['name']);
    _phoneController =
        TextEditingController(text: widget.userProfile['phonenumber']);
    _passwordController =
        TextEditingController(text: widget.userProfile['password']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTextField({
      required TextEditingController controller,
      required String hintText,
      required IconData icon,
      required TextInputType keyboard,
      int? maxlength,
    }) {
      return Container(
        width: mediaquerywidht(0.9, context),
        decoration: BoxDecoration(
          color: whitecolor,

          borderRadius: BorderRadius.circular(20.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          //     spreadRadius: 4,
          //     blurRadius: 5,
          //     offset: const Offset(0, 8),
          //   ),
          // ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: TextFormField(
            keyboardType: keyboard,
            maxLength: maxlength,
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
                            : NetworkImage(
                                "${widget.userProfile['imagepath']}"),
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
            keyboard: TextInputType.name,
            controller: _nameController,
            hintText: 'Enter Your Name',
            icon: Icons.person),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        buildTextField(
            keyboard: TextInputType.number,
            maxlength: 10,
            controller: _phoneController,
            hintText: 'Enter Your Phone number',
            icon: Icons.phone),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        buildTextField(
            keyboard: TextInputType.number,
            maxlength: 6,
            controller: _passwordController,
            hintText: 'Enter Your Password',
            icon: Icons.password),
        SizedBox(
          height: mediaqueryheight(0.07, context),
        ),
        Editprofilesavebutton(
            nameController: _nameController,
            phoneController: _phoneController,
            passwordController: _passwordController),
      ],
    );
  }
}
