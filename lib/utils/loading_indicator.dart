import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/utils/colors.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                    scale: 1,
                    child: LoadingAnimationWidget.threeArchedCircle(
                        color: whitecolor, size: 60)),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class DialogUtilss {
  static void showLoadingDialog(BuildContext context) {
    Center(
      child:
          LoadingAnimationWidget.threeArchedCircle(color: whitecolor, size: 60),
    );
  }
}
