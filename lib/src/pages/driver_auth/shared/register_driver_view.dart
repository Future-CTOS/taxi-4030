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
  final TextEditingController phoneNumberTextController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sizeScreen = MediaQuery.of(context).size.height / 1.75;
    final imageHeight = sizeScreen * 0.4;
    final double offset = 90;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: sizeScreen,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
              color: theme.colorScheme.surfaceContainer,
            ),
          ),
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
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.brightness == Brightness.dark
                        ? theme.colorScheme.onSecondary
                        : null,
                  ),
                ),
                AppSpacing.largeVerticalSpacer,
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: theme.brightness == Brightness.dark
                        ? theme.colorScheme.secondary
                        : null,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.largeVerticalSpacer,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "شماره همراه",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.onSecondary
                          : null,
                    ),
                  ),
                ),
                AppSpacing.mediumVerticalSpacer,
                PhoneNumberField(
                  validator: (value) => Validators.validateMobile(value),
                  textController: phoneNumberTextController,
                  isHighlighted: isActiveBottomButton,
                ),
                AppSpacing.xxLargeVerticalSpacer,
                PageBottomButton(
                  label: 'ثبت نام',
                  onTap: isActiveBottomButton ? onSubmit : () {},
                  isActive: isActiveBottomButton,
                  isLoading: isLoading,
                  transparentBackground: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
