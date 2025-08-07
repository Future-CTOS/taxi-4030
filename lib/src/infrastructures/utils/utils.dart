import 'dart:ui';

import 'package:flutter/material.dart';

import '../../components/permission_bottom_sheet.dart';
import '../../pages/shared/model/enum/status_enum.dart';

class Utils {
  static bool isEmailValid(String email) => RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);

  static bool isMobileValid(String mobile) =>
      ((mobile.startsWith('0') || mobile.startsWith('9')) &&
              mobile.length == 10 ||
          mobile.length == 11)
      ? true
      : false;

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

  static const Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  static void showPermissionBottomSheet({
    required BuildContext context,
    bool requestCamera = false,
    bool requestMicrophone = false,
    bool requestStorage = false,
    bool requestClipboard = false,
  }) => WidgetsBinding.instance.addPostFrameCallback((_) async {
    await Future.delayed(Duration(seconds: 1));
    showGeneralDialog(
      context: context,
      barrierLabel: 'PermissionSheet',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SizedBox.shrink();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedValue = Curves.easeInOut.transform(animation.value);
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Opacity(
            opacity: animation.value,
            child: Transform.translate(
              offset: Offset(0, (1 - curvedValue) * 300),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.transparent,
                  child: PermissionBottomSheet(
                    requestClipboard: requestClipboard,
                    requestCamera: requestCamera,
                    requestMicrophone: requestMicrophone,
                    requestStorage: requestStorage,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  });
}
