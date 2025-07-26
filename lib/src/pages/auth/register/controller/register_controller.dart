import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/validators.dart';

class RegisterController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nationalCodeController = TextEditingController();

  final isFormFilled = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_checkFormStatus);
    lastNameController.addListener(_checkFormStatus);
    nationalCodeController.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final firstNameValid =
        Validators.validateFirstName(firstNameController.text) == null;
    final lastNameValid =
        Validators.validateLastName(lastNameController.text) == null;
    final nationalCodeValid =
        Validators.validateNationalCode(nationalCodeController.text) == null;

    isFormFilled.value = firstNameValid && lastNameValid && nationalCodeValid;
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
      Get.back(result: true);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalCodeController.dispose();
    super.onClose();
  }
}
