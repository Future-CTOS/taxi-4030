import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';
import 'package:taxi_4030/src/pages/driver_auth/shared/widgets/upload_image_button.dart';

import '../../../../gen/assets.gen.dart';


class SelfieAuthView extends StatelessWidget {
  const SelfieAuthView({
    super.key,
    required this.isLoading,
    required this.onUploadButtonTap,
  });

  final bool isLoading;
  final void Function() onUploadButtonTap;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: UploadImageButton(
          isLoading: isLoading,
          onTap: onUploadButtonTap,
          label: 'ثبت عکس',
          emptyImagePath: '',
          filledImagePath: Assets.pngs.profile.path,
          hasFile: true,
        ),
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'این تصویری است که مسافران در اپلیکیشن به عنوان چهره شما مشاهده میکنند.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Text(
        'تصویر به صورت تمام رخ (از رو به رو) باشد.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Text(
        'ترجیحا با پس زمینه سفید یا ساده باشد.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Text(
        'بدون هرگونه زیورآلات مانند زنجیر،گوشواره،کلاه یا عینک آفتابی باشد.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  );
}
