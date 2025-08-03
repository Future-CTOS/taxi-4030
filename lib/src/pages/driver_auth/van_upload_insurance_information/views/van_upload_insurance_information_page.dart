import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/widgets/upload_image_button.dart';
import '../controller/van_upload_insurance_information_controller.dart';

class VanUploadInsuranceInformationPage
    extends GetView<VanUploadInsuranceInformationController> {
  const VanUploadInsuranceInformationPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
    bodyTitle: 'اطلاعات بیمه',
    bodySubTitle: 'عکس بیمه نامه خود را بارگذاری کنید',
    bottomSheet: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: controller.isActiveContinue.value
            ? controller.uploadInsuranceImage
            : () {},
        isActive: controller.isActiveContinue.value,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: Obx(
      () => UploadImageButton(
        isLoading: controller.isLoading.value,
        onTap: controller.onUploadButtonTap,
        label: 'بارگذاری',
        emptyImagePath: '',
        filledImagePath: Assets.pngs.uploadImage.path,
        hasFile: true,
      ),
    ),
  );
}
