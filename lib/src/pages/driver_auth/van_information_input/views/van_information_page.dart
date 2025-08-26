import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/drop_down.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/widgets/iranian_car_plate.dart';
import '../controller/van_information_controller.dart';
import '../models/view_models/van_information_input_view_model.dart';

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
      if (controller.vanInformation.value != null) {
        return _content(controller.vanInformation.value!);
      } else {
        return CircularProgressIndicator();
      }
    }),
  );

  Widget _content(VanInformationInputViewModel vanInformation) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            IranianCarPlate(
              letters: controller.iranAllLicensePlateLetters,
              selectedLetter: controller.selectedLetter.value,
              onCompleted: controller.onCompletedIranianPlate,
            ),
            CustomDropDown(
              title: 'سیستم و تیپ وانت',
              items: vanInformation.vanTypes,
              getTitle: (item) => item,
              hint: 'سیستم و تیپ وانت',
              onSelectItem: controller.onSelectedVanTypeItem,
              value: controller.vanType.value,
            ),
            CustomDropDown(
              title: 'مدل (سال تولید وانت)',
              items: vanInformation.vanYears
                  .map((element) => element.toString())
                  .toList(),
              getTitle: (item) => item.toString(),
              hint: 'مدل (سال تولید وانت)',
              onSelectItem: controller.onSelectedVanYearItem,
              value: controller.vanYear.value,
            ),
            CustomDropDown(
              title: 'رنگ وانت',
              items: vanInformation.vanColors,
              getTitle: (item) => item,
              hint: 'رنگ وانت',
              onSelectItem: controller.onSelectedVanColorItem,
              value: controller.vanColor.value,
            ),
            CustomDropDown(
              title: 'حداکثر ظرفیت بار',
              items: vanInformation.vanLoadCapacities
                  .map((element) => element.toString())
                  .toList(),
              getTitle: (item) => item,
              hint: 'حداکثر ظرفیت بار',
              onSelectItem: controller.onSelectedVanLoadCapacityItem,
              value: controller.vanLoadCapacity.value,
            ),
          ],
        ),
      );

  /*
  * CustomDropDown(
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
            ),*/
}
