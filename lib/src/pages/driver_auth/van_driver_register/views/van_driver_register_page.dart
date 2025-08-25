import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../shared/register_driver_view.dart';
import '../controller/van_driver_register_controller.dart';

class VanDriverRegisterPage extends GetView<VanDriverRegisterController> {
  const VanDriverRegisterPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyPadding: AppSpacing.zeroPadding,
    body: Obx(
      () => RegisterDriverView(
        title: 'ثبت نام راننده وانت',
        subtitle: 'شماره همراه و کد ملی خود را وارد کنید.',
        imagePath: Assets.pngs.van2d.path,
        phoneNumberTextController: controller.phoneNumberController,
        onSubmit: () => controller.requestOtp(context),
        isLoading: controller.isLoading.value,
        isActiveBottomButton: controller.isFormFilled.value,
      ),
    ),
  );
}
