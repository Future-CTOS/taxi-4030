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
      ),
    ),
  );

  /*CustomScaffold(body: _body(context));

  Widget _body(BuildContext context) => Column(
    children: [
      Expanded(flex: 1, child: _headerContent(context)),
      Expanded(flex: 2, child: _inputOtpVerifyNumbers(context)),
      Obx(() {
        if (controller.isResendEnabled.value) {
          return PageBottomButton(
            label: 'دریافت مجدد کد',
            isActive: true,
            onTap: controller.resendOtp,
          );
        }
        return SizedBox.shrink();
      }),
    ],
  );

  Widget _headerContent(BuildContext context) => Column(
    children: [
      Text(
        'کد ارسال شده را وارد کنید',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'کد 6 رقمی به شماره همراه شما ارسال شد',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  Widget _inputOtpVerifyNumbers(BuildContext context) => InputOtpVerify();*/
}
