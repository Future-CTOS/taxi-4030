import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../model/car_card_upload_model.dart';

class CarCardUploadController extends GetxController {
  final isSubmitLoading = false.obs;
  final isCompletedInfo = false.obs;

  final frontImageModel = CarCardUploadModel().obs;
  final backImageModel = CarCardUploadModel().obs;

  Future<void> pickImage({required bool isFrontImage}) async {
    final Rx<CarCardUploadModel> target = isFrontImage
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
      Get.toNamed(TaxiRouteNames.carInformationInput.uri);
    } finally {
      isSubmitLoading.value = false;
    }
  }
}
