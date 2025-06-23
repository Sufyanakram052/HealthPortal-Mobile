import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String lat = '';
String long = '';

class Utils {
  static SnackBar showSnackBar(String? text, Color backgroundColor) {
    // if(text == null ) return;
    return SnackBar(
      content: Text(
        text!,
      ),
      backgroundColor: backgroundColor,
    );
  }

  /// SnackBar
  static snackBarWidget(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Show flutter toast snack bar
  static flutterSuccessToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static flutterErrorToastMessage(
    String message,
  ) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,
    );
  }
}
