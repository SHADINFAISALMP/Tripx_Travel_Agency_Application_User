// import 'package:flutter/material.dart';

// import 'package:tripx_user_application/screens/profile/profile.dart';
// import 'package:tripx_user_application/utils/colors.dart';
// import 'package:tripx_user_application/utils/fonts.dart';
// import 'package:tripx_user_application/utils/mediaquery.dart';

import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/profile/profile.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Headertexttwo extends StatelessWidget {
  const Headertexttwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "WHAT SERVICE ARE YOU LOOKING?",
      textAlign: TextAlign.start,
      style: TextStyle(
          fontFamily: 'sedan',
          fontSize: mediaqueryheight(.021, context),
          color: whitecolor,
          fontWeight: FontWeight.normal),
    );
  }
}

class HeaderName extends StatelessWidget {
  const HeaderName({
    super.key,
    required this.userProfile,
  });

  final Map<String, dynamic> userProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: mediaquerywidht(0.3, context),
      ),
      child: mytext(
        "HELLO ${userProfile['name'].toString().toUpperCase()},",
        color: blackcolor,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'sedan',
        fontSize: mediaqueryheight(.021, context),
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
    required this.userProfile,
  });

  final Map<String, dynamic> userProfile;

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
              final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);
              if (scaffoldState != null) {
                scaffoldState.openDrawer();
              } else {
                print('Scaffold state is not available');
              }
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
              backgroundImage: NetworkImage("${userProfile['imagepath']}"),
            ),
          ),
        ],
      ),
    );
  }
}
