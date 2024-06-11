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
                        color: orangecolor,
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
        SizedBox(
          width: mediaquerywidht(.9, context),
          child: TextFormField(
            keyboardType: TextInputType.name,
            maxLength: null,
            controller: _nameController,
            style: const TextStyle(
              color: colorteal,
              fontSize: 20,
              backgroundColor: whitecolor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: orangecolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when enabled
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        SizedBox(
          width: mediaquerywidht(.9, context),
          child: TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 10,
            controller: _phoneController,
            style: const TextStyle(
              fontSize: 20,
              color: colorteal,
              backgroundColor: whitecolor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Your Phone number',
              prefixIcon: const Icon(Icons.phone),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: orangecolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when enabled
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(0.02, context),
        ),
        SizedBox(
          width: mediaquerywidht(0.9, context),
          child: TextFormField(
            keyboardType: TextInputType.name,
            maxLength: 6,
            controller: _passwordController,
            style: const TextStyle(
              fontSize: 20,
              color: colorteal,
              backgroundColor: whitecolor,
            ),
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              prefixIcon: const Icon(Icons.password),
              prefixIconColor: colorteal,
              fillColor: whitecolor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: orangecolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when enabled
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: orangecolor, // Border color when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
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
