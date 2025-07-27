import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/custom_otp_field.dart';
import '../../../../../infrastructures/routes/route_names.dart';
import '../../../../../infrastructures/utils/date_time_utils.dart';
import '../../../../../infrastructures/utils/spacing.dart';
import '../../controller/otp_verify_page_controller.dart';

class InputOtpVerify extends GetView<OtpVerifyPageController> {
  const InputOtpVerify({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ویرایش شماره همراه',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => controller.backToInputNumberPage(),
          ),
        ],
      ),
      AppSpacing.largeVerticalSpacer,
      Text('کد', style: Theme.of(context).textTheme.bodySmall),
      AppSpacing.mediumVerticalSpacer,
      Obx(
        () => CustomOtpField(
          isExpired: controller.isExpired.value,
          onCompleted: (value) {
            Get.offAndToNamed(TaxiRouteNames.userRegister.path);
          },
          enabled: !controller.isResendEnabled.value,
          shouldClear: controller.isResendEnabled.value,
        ),
      ),
      AppSpacing.mediumVerticalSpacer,
      Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.expired.value
                  ? 'زمان به پایان رسید'
                  : 'کد را وارد کنید',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: controller.expired.value
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              controller.formattedTime(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: controller.expired.value
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
