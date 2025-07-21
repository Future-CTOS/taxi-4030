import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/button.dart';
import 'package:taxi_4030/src/infrastructures/theme/colors.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../controller/log_in_page_controller.dart';

class LogInPageView extends GetView<LogInPageController> {
  const LogInPageView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: _body(context),
    backgroundColor: AppColors.darkBackgroundColor,
  );

  Widget _body(BuildContext context) => SafeArea(
    child: Column(
      children: [
        Image.asset(Constants.logInBackgroundImage),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.largeSpace,
            ),
            child: Column(
              children: [
                CustomTextField(
                  textController: controller.phoneNumberTextEditingController,
                  hint: LocaleKeys.taxi_4030_app_auth_enter_phone_number.tr,
                  isNumber: true,
                  isRequired: true,
                  maxLength: 11,
                ),
                Obx(
                  () => CustomButton(
                    label: LocaleKeys.taxi_4030_app_auth_submit_phone_number.tr,
                    action: () => controller.onSubmitPhoneNumberTap(context),
                    isDisable: controller.isSubmittingPhoneNumber.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
