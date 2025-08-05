import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/validators.dart';

class DriverPersonalInfoController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nationalCodeController = TextEditingController();
  final nationalIdController = TextEditingController();
  final fatherName = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  final isFormFilled = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_checkFormStatus);
    lastNameController.addListener(_checkFormStatus);
    nationalCodeController.addListener(_checkFormStatus);
    nationalIdController.addListener(_checkFormStatus);
    fatherName.addListener(_checkFormStatus);
    dayController.addListener(_checkFormStatus);
    monthController.addListener(_checkFormStatus);
    yearController.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final firstNameValid =
        Validators.validateFirstName(firstNameController.text) == null;
    final lastNameValid =
        Validators.validateLastName(lastNameController.text) == null;
    final nationalCodeValid =
        Validators.nationalCodeValidator(nationalCodeController.text) == null;

    final nationalIdValid =
        Validators.nationalIdValidator(nationalIdController.text) == null;
    final fatherNameValid =
        Validators.validateFirstName(fatherName.text) == null;
    final dateControllerValid =
        Validators.validateDate(
          day: dayController.text,
          month: monthController.text,
          year: yearController.text,
        ) ==
        null;
    isFormFilled.value =
        firstNameValid &&
        lastNameValid &&
        nationalCodeValid &&
        nationalIdValid &&
        fatherNameValid &&
        dateControllerValid;
  }

  Future<void> submitUserInfo() async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed(TaxiRouteNames.driverActivityInfo.uri);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalCodeController.dispose();
    nationalIdController.dispose();
    fatherName.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.onClose();
  }
}
