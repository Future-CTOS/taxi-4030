import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../shared/upload_document_view/upload_document_view.dart';
import '../controller/driver_license_upload_controller.dart';

class DriverLicenseUploadPage extends GetView<DriverLicenseUploadController> {
  const DriverLicenseUploadPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'تصویر گواهینامه',
    bodySubTitle: 'عکس پشت و روی کارت گواهینامه را بارگذاری کنید.',
    bodyPadding: EdgeInsets.only(
      right: Constants.horizontalPagePaddingSize,
      left: Constants.horizontalPagePaddingSize,
      bottom: Constants.verticalPagePaddingSize,
    ),
    body: Obx(
      () => UploadDocumentPage(
        frontEmptyImage: Assets.pngs.frontDrivingLicenses.path,
        frontFilledImage: Assets.pngs.frontDrivingLicensesFilled.path,
        backEmptyImage: Assets.pngs.backDrivingLicenses.path,
        backFilledImage: Assets.pngs.backDrivingLicensesFilled.path,
        frontLabel: 'تصویر روی گواهینامه',
        backLabel: 'تصویر پشت گواهینامه',
        isFrontLoading: controller.frontImageModel.value.isLoading,
        isBackLoading: controller.backImageModel.value.isLoading,
        isSubmitLoading: controller.isSubmitLoading.value,
        isSubmitEnabled: controller.isCompletedInfo.value,
        hasFrontFile: controller.frontImageModel.value.file != null,
        hasBackFile: controller.backImageModel.value.file != null,
        onFrontTap: () => controller.pickImage(isFrontImage: true),
        onBackTap: () => controller.pickImage(isFrontImage: false),
        onSubmit: controller.submitUserInfo,
      ),
    ),
  );
}
