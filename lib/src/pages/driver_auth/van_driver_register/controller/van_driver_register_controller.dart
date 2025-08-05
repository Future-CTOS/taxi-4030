import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/validators.dart';

class VanDriverRegisterController extends GetxController {
  final phoneNumberController = TextEditingController();

  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;

  void _checkFormStatus() {
    final phoneNumber =
        Validators.validateMobile(phoneNumberController.text) == null;
    isFormFilled.value = phoneNumber;
  }

  Future<void> submitUserInfo() async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed(TaxiRouteNames.driverPersonalInfo.uri);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    phoneNumberController.addListener(_checkFormStatus);
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
