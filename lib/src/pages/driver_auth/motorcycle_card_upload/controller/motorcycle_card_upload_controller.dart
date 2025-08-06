import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../model/motorcycle_card_upload_model.dart';

class MotorcycleCardUploadController extends GetxController {
  final isSubmitLoading = false.obs;
  final isCompletedInfo = false.obs;

  final frontImageModel = MotorcycleCardUploadModel().obs;
  final backImageModel = MotorcycleCardUploadModel().obs;

  Future<void> pickImage({required bool isFrontImage}) async {
    final Rx<MotorcycleCardUploadModel> target = isFrontImage
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
      Get.toNamed(TaxiRouteNames.motorcycleInformationInput.uri);
    } finally {
      isSubmitLoading.value = false;
    }
  }
}
