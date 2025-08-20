import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/drop_down.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/widgets/iranian_car_plate.dart';
import '../controller/car_information_controller.dart';
import '../models/view_models/car_information_input_view_model.dart';

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
        onTap: () => controller.submitDriverInfo(context),
        isActive: true,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: Obx(() {
      if (controller.carInformation.value != null) {
        return _content(controller.carInformation.value!);
      } else {
        return CircularProgressIndicator();
      }
    }),
  );

  Widget _content(CarInformationInputViewModel carInformation) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IranianCarPlate(
        letters: controller.iranAllLicensePlateLetters,
        selectedLetter: controller.selectedLetter.value,
        onCompleted: controller.onCompletedIranianPlate,
      ),
      CustomDropDown(
        title: 'سیستم و تیپ خودرو',
        items: carInformation.carModels,
        getTitle: (item) => item,
        hint: 'سیستم و تیپ خودرو',
        onSelectItem: (final value) => controller.carType.value = value,
        value: controller.carType.value,
      ),
      CustomDropDown(
        title: 'مدل (سال تولید خودرو)',
        items: carInformation.carYears
            .map((element) => element.toString())
            .toList(),
        onSelectItem: (final value) => controller.carYear.value = value,
        getTitle: (item) => item,
        hint: 'مدل (سال تولید خودرو)',
        value: controller.carYear.value,
      ),
      CustomDropDown(
        title: 'رنگ خودرو',
        items: carInformation.carColors,
        getTitle: (item) => item,
        hint: 'رنگ خودرو',
        onSelectItem: (final value) => controller.carColor.value = value,
        value: controller.carColor.value,
      ),
      AppSpacing.giantVerticalSpacer,
    ],
  );
}
