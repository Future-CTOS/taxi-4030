import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/car_owner_details_view.dart';
import '../controller/van_owner_details_controller.dart';

class VanOwnerDetailsPage extends GetView<VanOwnerDetailsController> {
  const VanOwnerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات مالک وانت',
    bodySubTitle: 'وضعیت مالک وانت را مشخص کنید',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    // bottomNavigationBar: Obx(
    //   () => PageBottomButton(
    //     label: 'ادامه',
    //     onTap: controller.submitVanOwnerInfo,
    //     isActive: controller.isFormFilled.value,
    //     isLoading: controller.isLoading.value,
    //   ),
    // ),
    body: Obx(
      () => CarOwnerDetailsView(
        title: 'مالک وانت',
        items: controller.items,
        initialValue: controller.items.first,
        firstNameController: controller.firstNameController,
        fatherName: controller.fatherName,
        formKey: controller.formKey,
        lastNameController: controller.lastNameController,
        nationalIdController: controller.nationalIdController,
        isLoading: controller.isLoading.value,
        onSubmit: controller.submitVanOwnerInfo,
        isFormFilled: controller.isFormFilled.value,
        showFormOnIndex: 1,
      ),
    ),
  );
}
