import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';

class DriverActivityInfoController extends GetxController {
  final referralCode = TextEditingController();
  final address = TextEditingController();
  final cityActivity = TextEditingController();

  final isFormFilled = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    cityActivity.addListener(_checkFormStatus);
    address.addListener(_checkFormStatus);
    referralCode.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final cityActivityValid =
        Validators.validateCityActivity(cityActivity.text) == null;
    final addressValid = Validators.validateAddress(address.text) == null;
    final referralCodeValid =
        Validators.validateReferralCode(referralCode.text) == null;

    isFormFilled.value = cityActivityValid && addressValid && referralCodeValid;
  }

  Future<void> submitUserInfo() async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      Utils.showSnackBar(
        Get.context!,
        text: 'اطلاعات با موفقیت ثبت شد',
        status: StatusEnum.success,
      );
      Get.toNamed(TaxiRouteNames.driverLicenseUpload.uri);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    cityActivity.dispose();
    address.dispose();
    referralCode.dispose();
    super.onClose();
  }
}
