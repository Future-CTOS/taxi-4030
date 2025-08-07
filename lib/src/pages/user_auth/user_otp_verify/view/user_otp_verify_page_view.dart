import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../shared/views/oto_verify_view.dart';
import '../controller/user_otp_verify_page_controller.dart';

class UserOtpVerifyPageView extends GetView<UserOtpVerifyPageController> {
  const UserOtpVerifyPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    body: Obx(
      () => OtoVerifyView(
        formattedTime: controller.formattedTime(),
        isExpired: controller.isExpired.value,
        isResendEnabled: controller.isResendEnabled.value,
        onCompleted: (value) =>
            Get.offAndToNamed(TaxiRouteNames.userRegister.uri),
        resendOtp: () => controller.resendOtp(context),
        isLoading: controller.isLoading.value,
      ),
    ),
  );
}
