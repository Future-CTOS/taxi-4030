import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_4030/src/infrastructures/app_controller/app_controller.dart';
import 'package:taxi_4030/src/infrastructures/commons/current_vehicle.dart';
import 'dart:io' if (dart.library.html) 'dart:html' as html;
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/file_picker_service.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../model/driver_license_upload_image_model.dart';
import '../model/view_models/driver_license_upload_view_model.dart';
import '../repository/driver_license_upload_repository.dart';

class DriverLicenseUploadController extends GetxController {
  final isSubmitLoading = false.obs;
  final isCompletedInfo = false.obs;

  final frontImageModel = DriverLicenseUploadImageModel().obs;
  final backImageModel = DriverLicenseUploadImageModel().obs;

  final _repository = DriverLicenseUploadRepository();

  Future<void> submitImage({
    required bool isFrontImage,
    required BuildContext context,
  }) async {
    final Rx<DriverLicenseUploadImageModel> target = isFrontImage
        ? frontImageModel
        : backImageModel;
    target.update((val) => val?.isLoading = true);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      target.update((val) => val?.isLoading = false);
      return;
    }

    target.update((val) {
      val?.file = XFile(pickedFile.path);
      val?.isLoading = false;
    });

    if (frontImageModel.value.file != null &&
        backImageModel.value.file != null) {
      isCompletedInfo.value = true;
    }

    Uint8List bytes = await pickedFile.readAsBytes();

    if (target.value.file == null) {
      return;
    }
    final resultOrException = await _repository.uploadLicenseFront(
      bytes: bytes,
      file: frontImageModel.value.file!,
    );

    target.update((val) => val?.isLoading = false);

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

    isSubmitLoading.value = true;
  }
}
