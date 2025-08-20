import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../model/car_card_upload_model.dart';
import '../repository/car_card_upload_repository.dart';

class CarCardUploadController extends GetxController {
  final _repository = CarCardUploadRepository();
  final isSubmitLoading = false.obs;
  final isCompletedInfo = false.obs;

  final frontImageModel = CarCardUploadModel().obs;
  final backImageModel = CarCardUploadModel().obs;

  Future<void> submitFrontImage(BuildContext context) async {
    frontImageModel.update((value) => value?.isLoading = true);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      frontImageModel.update((value) => value?.isLoading = false);
      ;
      return;
    }
    frontImageModel.value.file = XFile(pickedFile.path);

    Uint8List bytes = await pickedFile.readAsBytes();

    final resultOrException = await _repository.uploadCardFront(
      bytes: bytes,
      file: frontImageModel.value.file!,
    );

    frontImageModel.update((value) => value?.isLoading = false);

    resultOrException.fold(
      (error) =>
          Utils.showSnackBar(context, text: error, status: StatusEnum.danger),
      (response) {
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
      },
    );

    if (frontImageModel.value.file != null &&
        backImageModel.value.file != null) {
      isCompletedInfo.value = true;
    }
  }

  Future<void> submitBackImage(BuildContext context) async {
    backImageModel.update((value) => value?.isLoading = true);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      backImageModel.value.isLoading = false;
      return;
    }

    backImageModel.value.file = XFile(pickedFile.path);

    Uint8List bytes = await pickedFile.readAsBytes();

    final resultOrException = await _repository.uploadCardBack(
      bytes: bytes,
      file: backImageModel.value.file!,
    );

    backImageModel.update((value) => value?.isLoading = false);

    resultOrException.fold(
      (error) =>
          Utils.showSnackBar(context, text: error, status: StatusEnum.danger),
      (response) {
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
      },
    );

    if (frontImageModel.value.file != null &&
        backImageModel.value.file != null) {
      isCompletedInfo.value = true;
    }
  }

  Future<void> submitUserInfo() async {
    if (!isCompletedInfo.value) return;
    isSubmitLoading.value = true;
    Get.toNamed(TaxiRouteNames.carInformationInput.uri);
  }

  @override
  void onInit() {
    Utils.showPermissionBottomSheet(context: Get.context!, requestCamera: true);
    super.onInit();
  }
}
