import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/persian_date_picker.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../../../components/number_text_field.dart';
import '../../../../components/national_code_field.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/user_register_controller.dart';

class UserRegisterPage extends GetView<UserRegisterController> {
  const UserRegisterPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'ثبت نام',
    bodySubTitle: 'اطلاعات خواسته شده را به فارسی وارد کنید',
    bodyPadding: EdgeInsetsGeometry.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    body: Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'نام',
              hint: 'نام خود را وارد کنید',
              textController: controller.firstNameController,
            ),
            AppSpacing.largeVerticalSpacer,
            CustomTextField(
              label: 'نام خانوادگی',
              hint: 'نام خانوادگی خود را وارد کنید',
              textController: controller.lastNameController,
            ),
            /* AppSpacing.largeVerticalSpacer,
            NumberTextField(
              controller: controller.nationalIdController,
              hint: 'شماره شناسامه خود را وارد کنید',
              label: 'شماره شناسامه',
              validator: Validators.nationalIdValidator,
            ),*/
            AppSpacing.largeVerticalSpacer,
            NationalCodeField(
              controller: controller.nationalCodeController,
              label: 'کد ملی',
            ),
            AppSpacing.largeVerticalSpacer,
            PersianDatePicker(
              onDateSelected: (selectedDate) =>
                  controller.selectedDateTime.value =
                      selectedDate ?? DateTime.now(),
              initialDate: DateTime.now(),
            ),
            /* AppSpacing.largeVerticalSpacer,
            CustomTextField(
              label: 'نام پدر',
              hint: 'نام پدر خود را وارد کنید',
              textController: controller.fatherName,
            ),*/
            AppSpacing.largeVerticalSpacer,
            NumberTextField(
              controller: controller.referralCoe,
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
            AppSpacing.xxLargeVerticalSpacer,
            Obx(
              () => PageBottomButton(
                label: 'ادامه',
                onTap: () => controller.isFormFilled.value
                    ? controller.submitUserInfo(context)
                    : () {},
                isActive: controller.isFormFilled.value,
                isLoading: controller.isLoading.value,
                transparentBackground: true,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
