import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

import '../res/app_colors.dart';

class Utils {

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 30,
        toastLength: Toast.LENGTH_SHORT);
  }



  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          backgroundColor: AppColors.flushBarSuccessColor,
          // title: "Snackbar",
          messageColor: Colors.black,
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(8),
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        )..show(context));
  }


  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          backgroundColor: Colors.red,
          // title: "Snackbar",
          messageColor: Colors.black,
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(8),
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static void fieldFocusChange(BuildContext context,
      FocusNode currentFocusNode,
      FocusNode nextFocusNode){

    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);



  }


}
