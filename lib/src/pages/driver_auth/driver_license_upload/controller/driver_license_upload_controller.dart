import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DriverLicenseUploadController extends GetxController {
  final isLoading = false.obs;
  final isCompletedInfo = false.obs;
  File? image;

  Future<void> openCamera() async {
    // todo: until this
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  Future<void> submitUserInfo() async {
    if (!isCompletedInfo.value) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar(
        "موفقیت",
        "اطلاعات ثبت شد",
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
      );
      // Get.toNamed(TaxiRouteNames..uri);
    } finally {
      isLoading.value = false;
    }
  }
}
