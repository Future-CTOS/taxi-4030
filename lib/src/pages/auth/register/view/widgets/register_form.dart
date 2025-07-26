import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../../../../../infrastructures/utils/constants.dart';
import '../../../../../infrastructures/utils/validators.dart';
import '../../controller/register_controller.dart';

class RegisterForm extends GetView<RegisterController> {
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
          Text('نام', style: Theme.of(context).textTheme.bodyLarge),
          AppSpacing.largeVerticalSpacer,
          _firstNameInput(context),
          AppSpacing.largeVerticalSpacer,
          Text('نام خانوادگی', style: Theme.of(context).textTheme.bodyLarge),
          AppSpacing.largeVerticalSpacer,
          _lastNameInput(context),
          AppSpacing.largeVerticalSpacer,
          Text('کد ملی', style: Theme.of(context).textTheme.bodyLarge),
          AppSpacing.largeVerticalSpacer,
          _nationalCodeInput(context),
        ],
      ),
    ),
  );

  Widget _firstNameInput(BuildContext context) => TextFormField(
    validator: (value) => Validators.validateFirstName(value),
    controller: controller.firstNameController,
    style: Theme.of(context).textTheme.bodyMedium,
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.next,
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[آ-ی\s]'))],
    decoration: _inputDecoration(
      context: context,
      hintText: 'نام خود را وارد کنید',
    ),
  );

  Widget _lastNameInput(BuildContext context) => TextFormField(
    validator: (value) => Validators.validateLastName(value),
    controller: controller.lastNameController,
    style: Theme.of(context).textTheme.bodyMedium,
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.next,
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[آ-ی\s]'))],
    decoration: _inputDecoration(
      context: context,
      hintText: 'نام خانوادگی خود را وارد کنید',
    ),
  );

  Widget _nationalCodeInput(BuildContext context) => TextFormField(
    validator: (value) => Validators.validateNationalCode(value),
    controller: controller.nationalCodeController,
    style: Theme.of(context).textTheme.bodyMedium,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10), // محدودیت طول ۱۰ رقم
    ],
    decoration: _inputDecoration(
      context: context,
      hintText: 'کد ملی خود را وارد کنید',
    ),
  );

  BorderRadius _borderRadius() =>
      BorderRadius.circular(Constants.textFiledRadius);

  InputDecoration _inputDecoration({
    required BuildContext context,
    required String hintText,
  }) => InputDecoration(
    hintText: hintText,
    hintStyle: Theme.of(context).textTheme.bodyMedium,
    focusedBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSecondary,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(borderRadius: _borderRadius()),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 1,
      ),
    ),
    border: const OutlineInputBorder(),
  );
}
