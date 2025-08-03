import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';

class VanSelfieAuthController extends GetxController {
  final RxBool isActiveContinue = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isUploadLoading = false.obs;
  File? file;

  Future<void> pickImage() async {
    isLoading.value = true;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) {
      return;
    }

    file = File(pickedFile.path);
    isLoading.value = false;
    isActiveContinue.value = true;
  }

  Future<void> uploadInsuranceImage() async {
    if (!isActiveContinue.value) return;
    isUploadLoading.value = true;
    try {
      Utils.showSnackBar(
        Get.context!,
        text: 'اطلاعات بیمه با موفقیت ثبت شد',
        status: StatusEnum.success,
      );
      Get.toNamed(TaxiRouteNames.authGuideStep1.uri);
    } finally {
      isUploadLoading.value = false;
    }
  }
}
