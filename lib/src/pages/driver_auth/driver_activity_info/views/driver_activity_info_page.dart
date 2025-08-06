import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../components/number_text_field.dart';
import '../../../../components/scaffold.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/driver_activity_info_controller.dart';

class DriverActivityInfoPage extends GetView<DriverActivityInfoController> {
  const DriverActivityInfoPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'ثبت نام',
    bodySubTitle: 'اطلاعات خواسته شده را به فارسی وارد کنید',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: controller.isFormFilled.value
            ? controller.submitUserInfo
            : () {},
        isActive: controller.isFormFilled.value,
        isLoading: controller.isLoading.value,
        transparentBackground: true,
      ),
    ),
    body: Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              label: 'شهر محل فعالیت',
              hint: 'شهر محل فعالیت خود را وارد کنید',
              textController: controller.cityActivity,
              validator: Validators.validateCityActivity,
            ),
            AppSpacing.largeVerticalSpacer,
            CustomTextField(
              label: 'آدرس',
              hint: 'آدرس خود را وارد کنید',
              textController: controller.address,
              validator: Validators.validateAddress,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[آ-یءيک۱۲۳۴۵۶۷۸۹0-9\s\.,\-_/()]'),
                ),
              ],
            ),
            AppSpacing.largeVerticalSpacer,
            NumberTextField(
              controller: controller.referralCode,
              validator: Validators.validateReferralCode,
              hint: 'کد معرف خود را وارد کنید',
              label: 'کد معرف',
            ),
            AppSpacing.smallVerticalSpacer,
            Text(
              'اختیاری',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
