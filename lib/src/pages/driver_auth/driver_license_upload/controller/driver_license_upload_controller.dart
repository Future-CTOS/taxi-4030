import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/app_controller/app_controller.dart';
import 'package:taxi_4030/src/infrastructures/commons/current_vehicle.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../model/driver_license_upload_image_model.dart';
import '../repository/driver_license_upload_repository.dart';

class DriverLicenseUploadController extends GetxController {
  final isSubmitLoading = false.obs;
  final isCompletedInfo = false.obs;

  final frontImageModel = DriverLicenseUploadImageModel().obs;
  final backImageModel = DriverLicenseUploadImageModel().obs;

  final _repository = DriverLicenseUploadRepository();

  Future<void> submitFrontImage(BuildContext context) async {
    frontImageModel.update((value) => value?.isLoading = true);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      frontImageModel.update((value) => value?.isLoading = false);
      return;
    }
    frontImageModel.value.file = XFile(pickedFile.path);

    Uint8List bytes = await pickedFile.readAsBytes();

    final resultOrException = await _repository.uploadLicenseFront(
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
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      backImageModel.update((value) => value?.isLoading = false);
      return;
    }
    backImageModel.value.file = XFile(pickedFile.path);

    Uint8List bytes = await pickedFile.readAsBytes();

    final resultOrException = await _repository.uploadLicenseBack(
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

  void _navigateToNextPage() {
    if (AppController.instance.currentVehicle == VehicleType.car) {
      Get.toNamed(TaxiRouteNames.carCardUpload.uri);
      return;
    } else if (AppController.instance.currentVehicle == VehicleType.motoCycle) {
      Get.toNamed(TaxiRouteNames.motorCycleCardUpload.uri);
      return;
    } else if (AppController.instance.currentVehicle == VehicleType.van) {
      Get.toNamed(TaxiRouteNames.vanCardUpload.uri);
      return;
    }
  }

  Future<void> submitUserInfo() async {
    if (!isCompletedInfo.value) return;
    _navigateToNextPage();
    isSubmitLoading.value = true;
  }

  @override
  void onInit() {
    Utils.showPermissionBottomSheet(context: Get.context!, requestCamera: true);
    super.onInit();
  }
}
