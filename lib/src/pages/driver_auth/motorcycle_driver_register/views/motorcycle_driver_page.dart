import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../shared/register_driver_view.dart';
import '../controller/motorcycle_driver_controller.dart';

class MotorcycleDriverPage extends GetView<MotorcycleDriverController> {
  const MotorcycleDriverPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    body: Obx(
      () => RegisterDriverView(
        title: 'ثبت نام رانننده موتور',
        subtitle: 'شماره همراه و کد ملی خود را وارد کنید.',
        imagePath: Assets.pngs.motorcycle2d.path,
        nationalCodeTextController: controller.nationalCodeController,
        phoneNumberTextController: controller.phoneNumberController,
        onSubmit: controller.submitUserInfo,
        isLoading: controller.isLoading.value,
        isActiveBottomButton: controller.isFormFilled.value,
      ),
    ),
  );
}
