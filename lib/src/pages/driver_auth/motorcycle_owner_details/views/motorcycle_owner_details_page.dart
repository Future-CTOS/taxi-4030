import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../shared/vehicle_owner_details_view.dart';
import '../controller/motorcycle_owner_details_controller.dart';

class MotorcycleOwnerDetailsPage
    extends GetView<MotorcycleOwnerDetailsController> {
  const MotorcycleOwnerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات مالک موتور سیکلت',
    bodySubTitle: 'وضعیت مالک موتورسیکلت را مشخص کنید',
    bodyPadding: EdgeInsets.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    body: Obx(
      () => VehicleOwnerDetailsView(
        title: 'مالک موتور سیکلت',
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
