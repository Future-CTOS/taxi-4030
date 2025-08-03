import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../shared/van_information_input_view.dart';
import '../controller/van_information_controller.dart';

class VanInformationPage extends GetView<VanInformationController> {
  const VanInformationPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات وانت',
    bodySubTitle:
        'هر کدام از اطلاعات زیر با کارت وانت مغایرت دارد را اصلاح کنید.',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    body: Obx(
      () => VanInformationInputView(
        iranLicenseLetters: controller.iranAllLicensePlateLetters,
        onContinueTap: controller.submitVanInfo,
        onCompletedIranianPlate: (final value) =>
            controller.onCompletedIranianPlate(value),
        selectedLetter: controller.selectedLetter.value,
        isLoading: controller.isLoading.value,
        isActiveContinueBottom: controller.isFormFilled.value,
      ),
    ),
  );
}
