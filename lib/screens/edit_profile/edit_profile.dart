import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mediaqueryheight(0.02, context),
              ),
              GestureDetector(
                onTap: () => openGallery(context),
                child: CircleAvatar(
                  radius: 90.0,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Opacity(
                        opacity: 0.999,
                        child: CircleAvatar(
                          radius: 90.0,
                          backgroundImage: imageFile != null
                              ? FileImage(File(imageFile!.path))
                                  as ImageProvider
                              : const AssetImage(
                                  "assets/images/paulwalker.jpg"),
                        ),
                      ),
                      const Icon(
                        Icons.photo_camera,
                        color: whitecolor,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.05, context),
              ),
              Container(
                width: mediaquerywidht(0.9, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: TextFormField(
                    style: TextStyle(
                      height: mediaqueryheight(0.003, context),
                      color: colorteal,
                      backgroundColor: whitecolor,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Paul walker",
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: colorteal,
                      fillColor: whitecolor,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                width: mediaquerywidht(0.9, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: TextFormField(
                    style: TextStyle(
                      height: mediaqueryheight(0.003, context),
                      color: colorteal,
                      backgroundColor: whitecolor,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Paulwalker@gmail.com",
                      prefixIcon: Icon(Icons.mail),
                      prefixIconColor: colorteal,
                      fillColor: whitecolor,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                width: mediaquerywidht(0.9, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: TextFormField(
                    style: TextStyle(
                      height: mediaqueryheight(0.003, context),
                      color: colorteal,
                      backgroundColor: whitecolor,
                    ),
                    decoration: const InputDecoration(
                      hintText: "1234567890",
                      prefixIcon: Icon(Icons.phone),
                      prefixIconColor: colorteal,
                      fillColor: whitecolor,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                width: mediaquerywidht(0.9, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: TextFormField(
                    style: TextStyle(
                      height: mediaqueryheight(0.003, context),
                      color: colorteal,
                      backgroundColor: whitecolor,
                    ),
                    decoration: const InputDecoration(
                      hintText: "27/11/2004",
                      prefixIcon: Icon(Icons.date_range),
                      prefixIconColor: colorteal,
                      fillColor: whitecolor,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                width: mediaquerywidht(0.9, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: TextFormField(
                    style: TextStyle(
                      height: mediaqueryheight(0.003, context),
                      color: colorteal,
                      backgroundColor: whitecolor,
                    ),
                    decoration: const InputDecoration(
                      hintText: "password",
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: colorteal,
                      fillColor: whitecolor,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryheight(0.03, context),
              ),
              Container(
                height: mediaqueryheight(0.07, context),
                width: mediaquerywidht(0.5, context),
                decoration: BoxDecoration(
                    color: orangecolor,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: mytext("Save",
                    fontFamily: sedan, fontSize: 26, color: whitecolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
