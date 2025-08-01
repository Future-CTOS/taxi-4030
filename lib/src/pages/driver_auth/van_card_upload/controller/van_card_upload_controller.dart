import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../model/van_card_upload_model.dart';

class VanCardUploadController extends GetxController {
  final isSubmitLoading = false.obs;
  final isCompletedInfo = false.obs;

  final frontImageModel = VanCardUploadModel().obs;
  final backImageModel = VanCardUploadModel().obs;

  Future<void> pickImage({required bool isFrontImage}) async {
    final Rx<VanCardUploadModel> target = isFrontImage
        ? frontImageModel
        : backImageModel;
    target.update((val) => val?.isLoading = true);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      return;
    }

    target.update((val) {
      val?.file = File(pickedFile.path);
      val?.isLoading = false;
    });

    if (frontImageModel.value.file != null &&
        backImageModel.value.file != null) {
      isCompletedInfo.value = true;
    }
  }

  Future<void> submitUserInfo() async {
    if (!isCompletedInfo.value) return;
    isSubmitLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar(
        "موفقیت",
        "اطلاعات ثبت شد",
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
      );
      Get.toNamed(TaxiRouteNames.vanInformationInput.uri);
    } finally {
      isSubmitLoading.value = false;
    }
  }
}
