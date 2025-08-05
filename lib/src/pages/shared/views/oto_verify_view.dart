import 'package:flutter/material.dart';

import '../../../components/custom_otp_field.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../widgets/page_bottom_button.dart';

class OtoVerifyView extends StatelessWidget {
  const OtoVerifyView({
    super.key,
    required this.isResendEnabled,
    required this.isExpired,
    required this.formattedTime,
    required this.resendOtp,
    required this.onCompleted,
  });

  final bool isResendEnabled;
  final bool isExpired;
  final Future<void> Function() resendOtp;
  final String formattedTime;
  final void Function(String) onCompleted;

  @override
  Widget build(BuildContext context) => _body(context);

  Widget _body(BuildContext context) => Column(
    children: [
      Expanded(flex: 1, child: _headerContent(context)),
      Expanded(flex: 2, child: _inputOtpVerifyNumbers(context)),
      if (isResendEnabled)
        PageBottomButton(
          label: 'دریافت مجدد کد',
          isActive: true,
          onTap: resendOtp,
        )
      else
        SizedBox.shrink(),
    ],
  );

  Widget _headerContent(BuildContext context) => Column(
    children: [
      Text(
        'کد ارسال شده را وارد کنید',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'کد 6 رقمی به شماره همراه شما ارسال شد',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  Widget _inputOtpVerifyNumbers(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ویرایش شماره همراه',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      AppSpacing.largeVerticalSpacer,
      Text('کد', style: Theme.of(context).textTheme.bodySmall),
      AppSpacing.mediumVerticalSpacer,
      CustomOtpField(
        isExpired: isExpired,
        onCompleted: onCompleted,
        enabled: !isResendEnabled,
        shouldClear: isResendEnabled,
      ),
      AppSpacing.mediumVerticalSpacer,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isExpired ? 'زمان به پایان رسید' : 'کد را وارد کنید',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isExpired
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Text(
            formattedTime,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isExpired
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    ],
  );
}
