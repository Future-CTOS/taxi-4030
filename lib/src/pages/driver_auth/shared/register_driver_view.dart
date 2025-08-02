import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../components/phone_number_filed.dart';
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
    final sizeScreen = MediaQuery.of(context).size.height / 1.75;
    final imageHeight = sizeScreen * 0.6;
    final double offset = 70;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: sizeScreen,
          child: ColoredBox(color: theme.colorScheme.surfaceContainer),
        ),
        Positioned(
          top: sizeScreen - imageHeight - offset,
          left: 0,
          right: 0,
          child: Image.asset(
            imagePath,
            height: imageHeight,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsGeometry.fromLTRB(
              AppSpacing.largeSpace,
              AppSpacing.largeSpace,
              AppSpacing.largeSpace,
              Constants.verticalPagePaddingSize,
            ),
            margin: EdgeInsetsGeometry.only(top: AppSpacing.smallSpace),
            child: Column(
              children: [
                Text(title, style: theme.textTheme.titleLarge),
                AppSpacing.largeVerticalSpacer,
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                AppSpacing.largeVerticalSpacer,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("شماره همراه", style: theme.textTheme.bodyMedium),
                ),
                AppSpacing.mediumVerticalSpacer,
                PhoneNumberField(
                  validator: (value) => Validators.iranMobileValidator(value),
                  textController: phoneNumberTextController,
                  isHighlighted: isActiveBottomButton,
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
        ),
      ],
    );
  }
}
