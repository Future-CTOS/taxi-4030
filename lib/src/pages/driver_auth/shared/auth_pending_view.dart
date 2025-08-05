import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../infrastructures/utils/spacing.dart';

class AuthPendingView extends StatelessWidget {
  const AuthPendingView({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: MediaQuery.of(context).size.height / 7,
          ),
          child: Image.asset(
            Assets.pngs.authPendingImage.path,
            fit: BoxFit.contain,
          ),
        ),
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'در حال حاضر تیم پشتیبانی در حال بررسی و اعتبارسنجی اطلاعات شماست.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'این فرآیند معمولاً چند دقیقه زمان می‌برد.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'به‌محض تأیید، از طریق پیامک یا نوتیفیکیشن به شما اطلاع داده خواهد شد.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  );
}
