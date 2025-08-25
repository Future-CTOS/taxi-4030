import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/widgets/upload_image_button.dart';
import '../controller/motorcycle_upload_insurance_information_controller.dart';

class MotorcycleUploadInsuranceInformationPage
    extends GetView<MotorcycleUploadInsuranceInformationController> {
  const MotorcycleUploadInsuranceInformationPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
    bodyTitle: 'اطلاعات بیمه',
    bodySubTitle: 'عکس بیمه نامه خود را بارگذاری کنید',
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: () => controller.isActiveContinue.value
            ? controller.onContinueTap()
            : () {},
        isActive: controller.isActiveContinue.value,
        isLoading: false,
        // transparentBackground: false,
      ),
    ),
    body: Obx(
      () => UploadImageButton(
        isLoading: controller.isLoading.value,
        onTap: () => controller.onUploadInsurance(context),
        label: 'بارگذاری',
        emptyImagePath: '',
        filledImagePath: Assets.pngs.uploadImage.path,
        hasFile: true,
      ),
    ),
  );
}
