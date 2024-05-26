import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/utils/colors.dart';

class Nopackageavailable extends StatelessWidget {
  const Nopackageavailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No Packages available'),
    );
  }
}

class Buildloadingindicator extends StatelessWidget {
  const Buildloadingindicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          LoadingAnimationWidget.threeArchedCircle(color: colorteal, size: 60),
    );
  }
}