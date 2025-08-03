import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
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
        isActiveContinueBottom: controller.isFormFilled.value,
        isLoading: controller.isLoading.value,
        onContinueTap: controller.submitVanOwnerInfo,
        showFormOnIndex: 1,
      ),
    ),
  );
}
