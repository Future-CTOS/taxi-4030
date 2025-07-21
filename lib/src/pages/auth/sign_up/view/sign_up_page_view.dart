import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/drop_down.dart';

import '../../../../components/scaffold.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../controller/sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) =>
      CustomScaffold(appBarTitle: _logo(), body: _body(context));

  Widget _body(BuildContext context) => SafeArea(
    child: Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          const Text(
            'به تاکسی 4030 خوش اومدی',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          AppSpacing.mediumVerticalSpacer,
          const Text(
            'با تاکسی 4030 سفرت امنه و مطمئنه.\nهمین حالا وارد شو',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          AppSpacing.giantVerticalSpacer,
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'شماره موبایل خود را وارد کنید',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          AppSpacing.largeVerticalSpacer,
          AppSpacing.largeVerticalSpacer,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'شماره تلفن',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          AppSpacing.tinyVerticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomTextField(
                  textController: controller.phoneNumberTextController,
                  isNumber: true,
                  isRequired: true,
                  maxLength: 11,
                ),
              ),
              AppSpacing.smallHorizontalSpacer,
              _countryCodePicker(),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                'دریافت کد',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _countryCodePicker() => SizedBox(
    height: 60,
    width: 110,
    child: Obx(
      () => CustomDropDown<String>(
        items: ['+98', '+1', '+77'],
        onSelectItem: (item) => controller.countryCode.value = item ?? '+98',
        getTitle: (item) => item,
        value: controller.countryCode.value,
        onClear: () => controller.countryCode.value = '+98',
      ),
    ),
  );

  Widget _logo() => Row(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
      AppSpacing.mediumHorizontalSpacer,
      const Text('تاکسی 4030'),
    ],
  );
}
