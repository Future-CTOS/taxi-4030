import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/vehicle_owner_details_view.dart';
import '../controller/van_owner_details_controller.dart';

class VanOwnerDetailsPage extends GetView<VanOwnerDetailsController> {
  const VanOwnerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات مالک وانت',
    bodySubTitle: 'وضعیت مالک وانت را مشخص کنید',
    body: Obx(
      () => VehicleOwnerDetailsView(
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
        selectedValue: '',
        onChangeTitle: (p0) {},
      ),
    ),
  );
}
