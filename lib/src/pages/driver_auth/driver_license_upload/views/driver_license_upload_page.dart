import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/loading.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/driver_license_upload_controller.dart';

class DriverLicenseUploadPage extends GetView<DriverLicenseUploadController> {
  const DriverLicenseUploadPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'تصویر گواهینامه',
    bodySubTitle: 'عکس پشت و روی کارت گواهینامه را بارگذاری کنید.',
    bottomSheet: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: () {},
        isActive: controller.isCompletedInfo.value,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: Obx(
      () => Column(
        children: [
          _top(context),
          AppSpacing.largeVerticalSpacer,
          bottom(context),
        ],
      ),
    ),
  );

  Widget _top(BuildContext context) => Column(
    children: [
      Image.asset(Assets.pngs.frontDrivingLicenses.path, fit: BoxFit.contain),
      AppSpacing.largeVerticalSpacer,
      _submit(
        context,
        onTap: controller.openCamera,
        label: 'تصویر روی گواهینامه',
        isLoading: controller.isLoading.value,
      ),
    ],
  );

  Widget bottom(BuildContext context) => Column(
    children: [
      Image.asset(
        Assets.pngs.backDrivingLicensesFill.path,
        fit: BoxFit.contain,
      ),
      AppSpacing.largeVerticalSpacer,
      _submit(
        context,
        onTap: controller.openCamera,
        label: 'تصویر پشت گواهینامه',
        isLoading: controller.isLoading.value,
      ),
    ],
  );

  Widget _submit(
    BuildContext context, {
    required String label,
    required VoidCallback onTap,
    bool isLoading = false,
  }) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.shapeRadius),
      ),
    ),
    onPressed: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        if (isLoading) ...[
          AppSpacing.smallHorizontalSpacer,
          SizedBox(
            width: 20,
            height: 20,
            child: isLoading ? const CustomLoading() : const SizedBox.shrink(),
          ),
        ],
      ],
    ),
  );
}
