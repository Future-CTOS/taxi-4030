import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/validators.dart';

class MotorcycleOwnerDetailsController extends GetxController {
  final List<String> items = ['خودم هستم', 'شخص دیگر'];
  final int showFormOnIndexForAnotherOwner = 1;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final fatherName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isFormFilled = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_checkFormStatus);
    lastNameController.addListener(_checkFormStatus);
    nationalIdController.addListener(_checkFormStatus);
    fatherName.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final firstNameValid =
        Validators.validateFirstName(firstNameController.text) == null;
    final lastNameValid =
        Validators.validateLastName(lastNameController.text) == null;
    final nationalIdValid =
        Validators.nationalIdValidator(nationalIdController.text) == null;
    final fatherNameValid =
        Validators.validateFirstName(fatherName.text) == null;

    isFormFilled.value =
        firstNameValid && lastNameValid && nationalIdValid && fatherNameValid;
  }

  Future<void> submitVanOwnerInfo() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed(TaxiRouteNames.motorcycleUploadInsurance.uri);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalIdController.dispose();
    fatherName.dispose();
    super.onClose();
  }
}
