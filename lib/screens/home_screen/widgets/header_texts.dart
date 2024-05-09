// import 'package:flutter/material.dart';

// import 'package:tripx_user_application/screens/profile/profile.dart';
// import 'package:tripx_user_application/utils/colors.dart';
// import 'package:tripx_user_application/utils/fonts.dart';
// import 'package:tripx_user_application/utils/mediaquery.dart';

import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
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

// class Headertextone extends StatelessWidget {
//   const Headertextone({
//     super.key,
//   });


//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         right: mediaquerywidht(.5, context),
//       ),
//       child: mytext(
//         "HELLO SHADIN,",
//         color: blackcolor,
//         fontFamily: 'sedan',
//         fontSize: mediaqueryheight(.021, context),
//       ),
//     );
//   }
// }
// class Headermenuprofile extends StatelessWidget {
//    Headermenuprofile({
//     super.key,
//   });
//    String email;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: mediaqueryheight(.060, context),
//         right: mediaquerywidht(.03, context),
//         left: mediaquerywidht(.03, context),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             onPressed: () {
//               final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);
//               if (scaffoldState != null) {
//                 scaffoldState.openDrawer();
//               } else {
//                 print('Scaffold state is not available');
//               }
//             },
//             icon: Icon(
//               Icons.menu,
//               color: whitecolor,
//               size: mediaqueryheight(.04, context),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => Profile(
                  
//                     ))),
//             child: CircleAvatar(
//               radius: mediaqueryheight(.03, context),
//               backgroundImage: const AssetImage("assets/images/paulwalker.jpg"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
