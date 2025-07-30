import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/phone_number_filed.dart';

import '../../../../components/scaffold.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/phone_input_page_controller.dart';

class PhoneInputPageView extends GetView<PhoneInputPageController> {
  const PhoneInputPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    appBarTitle: _logo(context),

    bottomSheet: Obx(
      () => PageBottomButton(
        label: 'دریافت کد',
        onTap: () => controller.onSubmitPhoneNumberTap(context),
        isActive: controller.isReceiveCodeActive.value,
      ),
    ),
    body: _body(context),
  );

  Widget _body(BuildContext context) => Column(
    children: [
      Expanded(flex: 1, child: _welcomeContent(context)),
      Expanded(flex: 2, child: _inputMobileNumber(context)),
    ],
  );

  Widget _welcomeContent(BuildContext context) => Column(
    children: [
      Text(
        'به تاکسی 4030 خوش اومدی',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      AppSpacing.mediumVerticalSpacer,
      Text(
        'با تاکسی 4030 سفرت امنه و مطمئنه.\nهمین حالا وارد شو',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

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
        () => PhoneNumberField(
          textController: controller.phoneNumberTextController,
          isHighlighted: controller.isReceiveCodeActive.value,
          onChange: controller.onChangeTextField,
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
