import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../../../components/birth_data_field.dart';
import '../../../../components/number_text_field.dart';
import '../../../../components/national_code_field.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/driver_personal_info_controller.dart';

class DriverPersonalInfoPage extends GetView<DriverPersonalInfoController> {
  const DriverPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'ثبت نام',
    bodySubTitle: 'اطلاعات خواسته شده را به فارسی وارد کنید',
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
            AppSpacing.largeVerticalSpacer,
            NumberTextField(
              controller: controller.nationalIdController,
              hint: 'شماره شناسامه خود را وارد کنید',
              label: 'شماره شناسامه',
              validator: Validators.nationalIdValidator,
            ),
            AppSpacing.largeVerticalSpacer,
            NationalCodeField(
              controller: controller.nationalCodeController,
              label: 'کد ملی',
            ),
            AppSpacing.largeVerticalSpacer,
            BirthDateField(
              dayController: controller.dayController,
              monthController: controller.monthController,
              yearController: controller.yearController,
            ),
            AppSpacing.largeVerticalSpacer,
            CustomTextField(
              label: 'نام پدر',
              hint: 'نام پدر خود را وارد کنید',
              textController: controller.fatherName,
            ),
            AppSpacing.largeVerticalSpacer,
            Obx(
              () => PageBottomButton(
                label: 'ادامه',
                onTap: controller.isFormFilled.value
                    ? controller.submitUserInfo
                    : () {},
                isActive: controller.isFormFilled.value,
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
