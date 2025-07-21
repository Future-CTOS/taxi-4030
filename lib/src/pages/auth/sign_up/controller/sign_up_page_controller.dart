import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  final RxString countryCode = '+98'.obs;

  final TextEditingController phoneNumberTextController =
      TextEditingController();

  bool get isReceiveCodeActive => true;
}
