import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';

class PhoneInputPageController extends GetxController {
  final RxString countryCode = '+98'.obs;

  final TextEditingController phoneNumberTextController =
      TextEditingController();

  RxBool isReceiveCodeActive = false.obs;

  void onChangeTextField(String? text) {
    if (!Utils.isMobileValid(text?.trim() ?? '')) {
      isReceiveCodeActive.value = false;
      return;
    }
    isReceiveCodeActive.value = true;
  }

  void onSubmitPhoneNumberTap(BuildContext context) {
    if (!Utils.isMobileValid(phoneNumberTextController.text.trim())) {
      Utils.showSnackBar(
        context,
        text: 'شماره اشتباه است',
        status: StatusEnum.danger,
      );
      return;
    }
    Get.toNamed(TaxiRouteNames.userOtpVerify.path);
  }
}