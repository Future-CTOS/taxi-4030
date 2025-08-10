import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/pages/driver_auth/driver_otp_verify/controller/driver_otp_verify_controller.dart';
import '../../../../components/scaffold.dart';
import '../../../shared/views/oto_verify_view.dart';

class DriverOtpVerifyPage extends GetView<DriverOtpVerifyController> {
  const DriverOtpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    body: Obx(
      () => OtoVerifyView(
        formattedTime: controller.formattedTime(),
        isExpired: controller.isExpired.value,
        isResendEnabled: controller.isResendEnabled.value,
        onCompleted: (final value) =>
            controller.verifyOtp(context: context, value: value),
        resendOtp: () => controller.resendOtp(context),
        isLoading: controller.isLoading.value,
        isSubmitLoading: false,
      ),
    ),
  );
}
