import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/widgets/home_screen_widgets/home_screen_list_items.dart';

class Homescreenimagelistview extends StatelessWidget {
  const Homescreenimagelistview({
    super.key,
    required this.packageDetails,
  });

  final CollectionReference<Object?> packageDetails;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: packageDetails.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                color: whitecolor, size: 60),
          );
        }
        final querySnapshot = snapshot.data as QuerySnapshot;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            final item = querySnapshot.docs[index];
            List<String> images =
                (item['imagepath'] as List<dynamic>).cast<String>();
            return homescreen_list_items(context: context, imagePath: images.first, item: item);
          },
        );
      },
    );
  }
}