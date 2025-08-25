import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../repository/motorcycle_selfie_auth_repository.dart';

class MotorcycleSelfieAuthController extends GetxController {
  final _repository = MotorcycleSelfieAuthRepository();

  final RxBool isActiveContinue = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isUploadLoading = false.obs;

  Future<void> onUploadAuthVideo(BuildContext context) async {
    isLoading.value = true;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      isLoading.value = false;
      return;
    }

    Uint8List bytes = await pickedFile.readAsBytes();

    final resultOrException = await _repository.uploadAuthVideo(
      bytes: bytes,
      file: pickedFile,
    );
    isLoading.value = false;
    resultOrException.fold(
      (error) =>
          Utils.showSnackBar(context, text: error, status: StatusEnum.danger),
      (response) {
        isActiveContinue.value = true;
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
      },
    );
  }

  void onContinueTap() {
    if (!isActiveContinue.value) return;
    Get.toNamed(TaxiRouteNames.authGuideStep1.uri);
  }
}
