import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';
import 'package:taxi_4030/src/pages/driver_auth/shared/widgets/upload_image_button.dart';

import '../../../../gen/assets.gen.dart';
import '../../shared/widgets/page_bottom_button.dart';

class VideoAuthView extends StatelessWidget {
  const VideoAuthView({
    super.key,
    required this.isLoading,
    required this.onUploadButtonTap,
    required this.isActiveContinue,
    required this.isUploadLoading,
    required this.onContinueTap,
  });

  final bool isLoading;
  final void Function() onUploadButtonTap;
  final void Function() onContinueTap;
  final bool isActiveContinue;
  final bool isUploadLoading;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: UploadImageButton(
            isLoading: isLoading,
            onTap: onUploadButtonTap,
            label: 'ثبت عکس',
            emptyImagePath: '',
            filledImagePath: Assets.pngs.videoUploadImage.path,
            hasFile: true,
          ),
        ),
        AppSpacing.largeVerticalSpacer,
        Text(
          'لطفاً موارد زیر را در ویدیو رعایت کنید:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'کارت ملی خود را در دست داشته باشید و مقابل دوربین نمایش دهید.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'متن مشخص‌شده را با صدای واضح بخوانید.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          ' هنگام خواندن، آدرس محل سکونت و کد پستی خود را دقیق اعلام کنید.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          ' مطمئن شوید صورت و کارت ملی شما در تصویر کاملاً واضح هستند.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        AppSpacing.largeVerticalSpacer,
        _contentBox(context),
        AppSpacing.giantVerticalSpacer,
        PageBottomButton(
          label: 'ادامه',
          onTap: isActiveContinue ? onContinueTap : () {},
          isActive: isActiveContinue,
          isLoading: isUploadLoading,
        ),
        AppSpacing.largeVerticalSpacer,
      ],
    ),
  );

  DecoratedBox _contentBox(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ),
    ),
    child: Padding(
      padding: AppSpacing.largePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('متن توافق نامه:', style: Theme.of(context).textTheme.bodyLarge),
          Text(
            'من [نام و نام خانوادگی] هستم، ساکن [آدرس کامل] با کد پستی [کد پستی]',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'در حال حاضر کارت ملی خود را در دست دارم و تأیید می‌کنم که',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'تمامی اطلاعات واردشده در اپلیکیشن تاکسی 4030 متعلق به خودم',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'است و مسئولیت استفاده از این حساب را می‌پذیرم.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    ),
  );
}
