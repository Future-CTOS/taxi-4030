import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
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
            controller.verifyOtp(context: context, value: value),
        resendOtp: () => controller.resendOtp(context),
        isSubmitLoading: controller.isSubmitLoading.value,
        isLoading: controller.isLoading.value,
      ),
    ),
  );
}
