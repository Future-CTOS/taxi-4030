import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/validators.dart';

class CarDriverController extends GetxController {
  final nationalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;

  void _checkFormStatus() {
    final phoneNumber =
        Validators.iranMobileValidator(phoneNumberController.text) == null;

    final nationalCodeValid =
        Validators.nationalCodeValidator(nationalCodeController.text) == null;

    isFormFilled.value = phoneNumber && nationalCodeValid;
  }

  Future<void> submitUserInfo() async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar(
        "موفقیت",
        "اطلاعات ثبت شد",
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
      );
      Get.toNamed(TaxiRouteNames.otpVerify.uri);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    nationalCodeController.addListener(_checkFormStatus);
    phoneNumberController.addListener(_checkFormStatus);
  }

  @override
  void dispose() {
    nationalCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
