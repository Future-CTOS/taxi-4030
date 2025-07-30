import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/text_field.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../../../../../components/national_code_field.dart';
import '../../controller/user_register_controller.dart';

class RegisterForm extends GetView<UserRegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) => Form(
    key: controller.formKey,
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          NationalCodeField(
            controller: controller.nationalCodeController,
            label: 'کد ملی',
          ),
        ],
      ),
    ),
  );
}
