import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/drop_down.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/widgets/iranian_motorcycle_plate.dart';
import '../controller/motorcycle_information_input_controller.dart';
import '../models/view_models/motorcycle_information_input_view_model.dart';

class MotorcycleInformationInputPage
    extends GetView<MotorcycleInformationInputController> {
  const MotorcycleInformationInputPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات موتور',
    bodySubTitle:
        'هر کدام از اطلاعات زیر با کارت موتور مغایرت دارد را اصلاح کنید.',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: () => controller.isFormFilled.value
            ? controller.submitMotorcycleInfo(context)
            : null,
        isActive: controller.isFormFilled.value,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: Obx(() {
      if (controller.motorcycleInformation.value != null) {
        return _content(controller.motorcycleInformation.value!);
      } else {
        return CircularProgressIndicator();
      }
    }),
  );

  Widget _content(MotorcycleInformationInputViewModel motorcycleInformation) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            IranianMotorcyclePlate(
              letters: controller.iranAllLicensePlateLetters,
              selectedLetter: controller.selectedLetter.value,
              onCompleted: controller.onCompletedIranianPlate,
            ),
            CustomDropDown(
              title: 'نوع موتور',
              items: motorcycleInformation.motorcycleTypes,
              getTitle: (item) => item,
              hint: 'نوع موتور',
              onSelectItem: controller.onSelectedMotorCycleTypeItem,
              value: controller.motorcycleType.value,
            ),
            CustomDropDown(
              title: 'حجم موتور(cc)',
              items: motorcycleInformation.motorcycleCapacityEngine
                  .map((element) => element.toString())
                  .toList(),
              getTitle: (item) => item,
              hint: 'حجم موتور(cc)',
              onSelectItem: controller.onSelectedMotorCycleEngineTypeItem,
              value: controller.motorcycleCapacityEngine.value,
            ),
            CustomDropDown(
              title: 'کلاه ایمنی و تجهیزات ایمنی',
              items: controller.safetyEquipments,
              getTitle: (item) => item,
              hint: 'کلاه ایمنی و تجهیزات ایمنی',
              onSelectItem:
                  controller.onSelectedMotorCycleEngineSafetyEquipmentItem,
              value: controller.safetyEquipment.value,
            ),
          ],
        ),
      );
}
