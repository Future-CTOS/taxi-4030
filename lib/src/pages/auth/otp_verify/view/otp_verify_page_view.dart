import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';

import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/otp_verify_page_controller.dart';
import 'widgets/input_otp_verify.dart';

class OtpVerifyPageView extends GetView<OtpVerifyPageController> {
  const OtpVerifyPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(body: _body(context));

  Widget _body(BuildContext context) => Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 32),
    child: Column(
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
    ),
  );

  Widget _headerContent(BuildContext context) => Column(
    children: [
      Text(
        'کد ارسال شده را وارد کنید',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'کد 5 رقمی به شماره همراه شما ارسال شد',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  Widget _inputOtpVerifyNumbers(BuildContext context) => InputOtpVerify();
}
