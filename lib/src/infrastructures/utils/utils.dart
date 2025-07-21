import 'package:flutter/material.dart';

import '../../pages/shared/model/enum/status_enum.dart';

class Utils {
  static bool isEmailValid(String email) => RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);

  static bool isMobileValid(String mobile) =>
      (mobile.startsWith('09') && mobile.length == 11) ? true : false;

  static void showSnackBar(
    BuildContext context, {
    required String text,
    final StatusEnum? status,
  }) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      backgroundColor: status?.color,
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      duration: Duration(seconds: 2),
    ),
  );

  static void showInDevelopmentSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("در دست توسعه"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.blueAccent,
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          duration: Duration(seconds: 2),
        ),
      );
}
