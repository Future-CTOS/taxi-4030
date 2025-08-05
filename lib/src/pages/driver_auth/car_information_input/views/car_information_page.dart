import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/drop_down.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/van_information_input_view.dart';
import '../../shared/widgets/iranian_plate.dart';
import '../controller/car_information_controller.dart';

class CarInformationPage extends GetView<CarInformationController> {
  const CarInformationPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات خودرو سواری',
    bodySubTitle:
        'هر کدام از اطلاعات زیر با کارت وانت مغایرت دارد را اصلاح کنید.',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    body: Obx(
      () => Column(
        children: [
          IranianPlate(
            letters: controller.iranAllLicensePlateLetters,
            selectedLetter: controller.selectedLetter.value,
            onCompleted: controller.onCompletedIranianPlate,
          ),
          CustomDropDown(
            title: 'سیستم و تیپ وانت',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'سیستم و تیپ وانت',
            value: null,
          ),
          CustomDropDown(
            title: 'مدل (سال تولید وانت)',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'مدل (سال تولید وانت)',
            value: null,
          ),
          CustomDropDown(
            title: 'رنگ وانت',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'رنگ وانت',
            value: null,
          ),
          CustomDropDown(
            title: 'حداکثر ظرفیت بار',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'حداکثر ظرفیت بار',
            value: null,
          ),
          AppSpacing.giantVerticalSpacer,
          PageBottomButton(
            label: 'ادامه',
            onTap: controller.submitVanInfo,
            isActive: controller.isFormFilled.value,
            isLoading: controller.isLoading.value,
          ),
          AppSpacing.giantVerticalSpacer,
        ],
      ),
    ),
  );
}
