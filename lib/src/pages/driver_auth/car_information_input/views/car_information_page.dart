import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/drop_down.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/van_information_input_view.dart';
import '../../shared/widgets/iranian_car_plate.dart';
import '../controller/car_information_controller.dart';

class CarInformationPage extends GetView<CarInformationController> {
  const CarInformationPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات خودرو سواری',
    bodySubTitle:
        'هر کدام از اطلاعات زیر با کارت خودرو مغایرت دارد را اصلاح کنید.',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: controller.submitVanInfo,
        isActive: controller.isFormFilled.value,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IranianCarPlate(
            letters: controller.iranAllLicensePlateLetters,
            selectedLetter: controller.selectedLetter.value,
            onCompleted: controller.onCompletedIranianPlate,
          ),
          CustomDropDown(
            title: 'سیستم و تیپ خودرو',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'سیستم و تیپ خودرو',
            value: null,
          ),
          CustomDropDown(
            title: 'مدل (سال تولید خودرو)',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'مدل (سال تولید خودرو)',
            value: null,
          ),
          CustomDropDown(
            title: 'رنگ خودرو',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'رنگ خودرو',
            value: null,
          ),
          // AppSpacing.giantVerticalSpacer,
          AppSpacing.giantVerticalSpacer,
        ],
      ),
    ),
  );
}
