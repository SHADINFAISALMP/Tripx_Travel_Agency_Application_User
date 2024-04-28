import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/profile/profile.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Headermenuprofile extends StatelessWidget {
  const Headermenuprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mediaqueryheight(.060, context),
        right: mediaquerywidht(.03, context),
        left: mediaquerywidht(.03, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Open the drawer using the GlobalKey
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: whitecolor,
              size: mediaqueryheight(.04, context),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Profile())),
            child: CircleAvatar(
              radius: mediaqueryheight(.03, context),
              backgroundImage: const AssetImage("assets/images/paulwalker.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
