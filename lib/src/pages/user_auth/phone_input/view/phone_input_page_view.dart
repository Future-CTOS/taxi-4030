import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/phone_number_filed.dart';

import '../../../../components/scaffold.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/phone_input_page_controller.dart';

class PhoneInputPageView extends GetView<PhoneInputPageController> {
  const PhoneInputPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    appBarTitle: _logo(context),
    bodyTitle: 'به تاکسی 4030 خوش اومدی',
    bodySubTitle: 'ی اپ و هزار راه.\nهمین حالا وارد شو',
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'دریافت کد',
        onTap: () => controller.onSubmitPhoneNumberTap(context),
        isActive: controller.isReceiveCodeActive.value,
        isLoading: controller.isLoading.value,
        transparentBackground: true,
      ),
    ),
    body: _inputMobileNumber(context),
  );

  // Widget _body(BuildContext context) => Column(
  //   children: [
  //     Expanded(flex: 1, child: _welcomeContent(context)),
  //     Expanded(flex: 2, child: _inputMobileNumber(context)),
  //   ],
  // );

  Widget _inputMobileNumber(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'شماره موبایل خود را وارد کنید',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      AppSpacing.largeVerticalSpacer,
      AppSpacing.largeVerticalSpacer,
      Text('شماره همراه', style: Theme.of(context).textTheme.bodySmall),
      AppSpacing.mediumVerticalSpacer,
      Obx(
        () => Form(
          key: controller.formKey,
          child: PhoneNumberField(
            textController: controller.phoneNumberTextController,
            isHighlighted: controller.isReceiveCodeActive.value,
            validator: Validators.validateMobile,
            onChange: controller.onChangeTextField,
          ),
        ),
      ),
    ],
  );

  Widget _countryCode(BuildContext context) => SizedBox(
    height: 48,
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSpacing.mediumSpace),
        ),
      ),
      child: Center(
        child: Text(
          '98+',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: controller.isReceiveCodeActive.value
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    ),
  );

  Widget _logo(BuildContext context) => Row(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
      AppSpacing.mediumHorizontalSpacer,
      Text('تاکسی 4030', style: Theme.of(context).textTheme.titleLarge),
    ],
  );
}
