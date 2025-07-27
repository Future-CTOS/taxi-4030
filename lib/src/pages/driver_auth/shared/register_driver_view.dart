import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/text_field.dart';
import '../../../infrastructures/utils/constants.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../../../infrastructures/utils/validators.dart';
import '../../shared/widgets/page_bottom_button.dart';

class RegisterDriverView extends StatelessWidget {
  const RegisterDriverView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onSubmit,
    required this.nationalCodeTextController,
    required this.phoneNumberTextController,
    required this.isLoading,
    required this.isActiveBottomButton,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onSubmit;
  final bool isLoading;
  final bool isActiveBottomButton;
  final TextEditingController nationalCodeTextController;
  final TextEditingController phoneNumberTextController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox()),
        Image.asset(imagePath, height: 180, fit: BoxFit.contain),
        AppSpacing.largeVerticalSpacer,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.largeSpace),
          decoration: BoxDecoration(
            // color: theme.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(title, style: theme.textTheme.titleLarge),
              AppSpacing.largeVerticalSpacer,
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              AppSpacing.xxLargeVerticalSpacer,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text("کد ملی", style: theme.textTheme.bodyMedium),
              ),
              AppSpacing.mediumVerticalSpacer,
              _nationalCode(context),
              AppSpacing.largeVerticalSpacer,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text("شماره همراه", style: theme.textTheme.bodyMedium),
              ),
              AppSpacing.mediumVerticalSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 8, child: _phoneNumber(context)),
                  AppSpacing.mediumHorizontalSpacer,
                  Expanded(flex: 1, child: _countryCode(context)),
                ],
              ),
              AppSpacing.xxLargeVerticalSpacer,
              PageBottomButton(
                label: 'ثبت نام',
                onTap: isActiveBottomButton ? onSubmit : () {},
                isActive: isActiveBottomButton,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _nationalCode(BuildContext context) => TextFormField(
    validator: Validators.nationalCodeValidator,
    controller: nationalCodeTextController,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: Theme.of(context).textTheme.bodyMedium,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ],
    decoration: _inputDecoration(
      context: context,
      hintText: 'کد ملی خود را وارد کنید',
    ),
  );

  Widget _phoneNumber(BuildContext context) => TextFormField(
    validator: Validators.iranMobileValidator,
    controller: phoneNumberTextController,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: Theme.of(context).textTheme.bodyMedium,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ],
    decoration: _inputDecoration(context: context, hintText: '9999999999'),
  );

  Widget _countryCode(BuildContext context) => SizedBox(
    height: 48,
    child: TextField(
      enabled: false,
      decoration: _inputDecoration(context: context, hintText: '98').copyWith(
        disabledBorder: OutlineInputBorder(
          borderRadius: _borderRadius(),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1,
          ),
        ),
      ),
    ),
  );

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

  BorderRadius _borderRadius() =>
      BorderRadius.circular(Constants.textFiledRadius);
}
