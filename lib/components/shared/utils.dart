import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color? snackbarColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5,
      duration: const Duration(seconds: 3),
      content: Text(message),
      backgroundColor: snackbarColor ?? Colors.grey.shade800,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

// void displayToast({
//   required BuildContext context,
//   required String message,
//   Color? snackbarColor,
// }) {
//   FlutterToast.showToast(
//     msg: "Hello Flutter Toast!",
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.grey[600],
//     textColor: Colors.white,
//   );
// }
