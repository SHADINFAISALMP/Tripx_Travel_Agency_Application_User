import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: colorteal,
        automaticallyImplyLeading: false,
        title: const Text(
          "FAVORITES",
          style: TextStyle(color: whitecolor),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
