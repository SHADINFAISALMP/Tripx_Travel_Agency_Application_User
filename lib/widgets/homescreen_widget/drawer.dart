import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

final List<Map<String, dynamic>> drawerItems = [
  {
    'icon': Icons.share,
    'title': 'Share App',
    'onTap': () {},
  },
  {
    'icon': Icons.support_agent_sharp,
    'title': 'Support',
    'onTap': () {},
  },
  {
    'icon': Icons.star,
    'title': 'Rate App',
    'onTap': () {
      // Add functionality for item 2
    },
  },
  {
    'icon': Icons.feed,
    'title': 'Send Feedback',
    'onTap': () {
      // Add functionality for item 2
    },
  },
  {
    'icon': Icons.info,
    'title': 'About us',
    'onTap': () {
      // Add functionality for item 2
    },
  },
  {
    'icon': Icons.privacy_tip,
    'title': 'Privacy Policy',
    'onTap': () {
      // Add functionality for item 2
    },
  },
];

class Headdrawer extends StatelessWidget {
  const Headdrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: colorteal,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: mediaqueryheight(.05, context),
                backgroundImage:
                    const AssetImage("assets/images/paulwalker.jpg"),
              ),
              mytext(
                'Hey Paul,',
                fontFamily: bodoni,
                fontSize: mediaqueryheight(0.03, context),
                color: whitecolor,
              )
            ],
          ),
        ),
        ...drawerItems.map((item) {
          return ListTile(
            leading: Icon(
              item['icon'],
              color: colorteal,
            ),
            title: mytext(
              item['title'],
              fontFamily: bodoni,
              fontSize: mediaqueryheight(.02, context),
              color: blackcolor,
            ),
            onTap: item['onTap'],
          );
        }).toList(),
        SizedBox(height: mediaqueryheight(.24, context)),
        Center(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        SizedBox(
          height: mediaqueryheight(.019, context),
        ),
        Center(
          child: Text(
            "Version 1.0.0",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: sedan,
                fontSize: 17,
                color: blackcolor,
                ),
          ),
        )
      ],
    );
  }
}
