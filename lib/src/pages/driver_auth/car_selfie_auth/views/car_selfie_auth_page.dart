import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/selfie_auth_view.dart';
import '../controller/car_selfie_auth_controller.dart';

class CarSelfieAuthPage extends GetView<CarSelfieAuthController> {
  const CarSelfieAuthPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'احراز هویت با گرفتن عکس سلفی',
    bodySubTitle: 'برای احراز هویت یک عکس سلفی از خود بگیرید',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: controller.isActiveContinue.value
            ? controller.onContinueTap
            : () {},
        isActive: controller.isActiveContinue.value,
        isLoading: controller.isUploadLoading.value,
      ),
    ),
    body: Obx(
      () => SelfieAuthView(
        isLoading: controller.isLoading.value,
        onUploadButtonTap: () => controller.onUploadAuthVideo(context),
      ),
    ),
  );
}
