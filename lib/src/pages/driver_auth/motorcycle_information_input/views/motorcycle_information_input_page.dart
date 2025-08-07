import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/drop_down.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/widgets/iranian_car_plate.dart';
import '../../shared/widgets/iranian_motorcycle_plate.dart';
import '../controller/motorcycle_information_input_controller.dart';

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
        onTap: controller.submitMotorcycleInfo,
        isActive: controller.isFormFilled.value,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: SingleChildScrollView(
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
            items: [],
            getTitle: (item) => 'ites',
            hint: 'نوع موتور',
            value: null,
          ),
          CustomDropDown(
            title: 'حجم موتور(cc)',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'حجم موتور(cc)',
            value: null,
          ),
          CustomDropDown(
            title: 'کلاه ایمنی و تجهیزات ایمنی',
            items: [],
            getTitle: (item) => 'ites',
            hint: 'کلاه ایمنی و تجهیزات ایمنی',
            value: null,
          ),
        ],
      ),
    ),
  );
}
