import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/gen/assets.gen.dart';

import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../shared/register_driver_view.dart';
import '../controller/car_driver_controller.dart';

class CarDriverPage extends GetView<CarDriverController> {
  const CarDriverPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyPadding: AppSpacing.zeroPadding,
    body: Obx(
      () => RegisterDriverView(
        title: 'ثبت نام رانننده سواری',
        subtitle: 'شماره همراه و کد ملی خود را وارد کنید.',
        imagePath: Assets.pngs.car2d.path,
        nationalCodeTextController: controller.nationalCodeController,
        phoneNumberTextController: controller.phoneNumberController,
        onSubmit: controller.submitUserInfo,
        isLoading: controller.isLoading.value,
        isActiveBottomButton: controller.isFormFilled.value,
      ),
    ),
  );
}
