import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/home_screen_list_items.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "FAVORITES",
            style: TextStyle(
                color: whitecolor,
                fontFamily: bodoni,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: colorteal,
        ),
        body: const Center(child: Text("User not logged in")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "FAVORITES",
          style: TextStyle(
              color: whitecolor,
              fontFamily: bodoni,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorteal,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('favorites')
            .doc(user.uid)
            .collection('userFavorites')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                    color: orangecolor, size: 60));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
              "No favorites yet",
              style: TextStyle(color: colorteal, fontWeight: FontWeight.bold),
            ));
          }

          var favoriteItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              var item = favoriteItems[index];
              return Homescreen_list_items(
                context: context,
                imagePath: item['imagePath'],
                item: item,
              );
            },
          );
        },
      ),
    );
  }
}
