import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/dtos/van_owner_details_dto.dart';
import '../models/view_models/van_owner_details_view_model.dart';
import '../repository/van_owner_details_repository.dart';

class VanOwnerDetailsController extends GetxController {
  final _repository = VanOwnerDetailsRepository();
  final List<String> items = ['خودم هستم', 'شخص دیگر'];
  final Rx<String> selectedValue = Rx<String>('خودم هستم');
  final int showFormOnIndexForAnotherOwner = 1;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final fatherName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isFormFilled = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_checkFormStatus);
    lastNameController.addListener(_checkFormStatus);
    nationalIdController.addListener(_checkFormStatus);
    fatherName.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final firstNameValid =
        Validators.validateFirstName(firstNameController.text) == null;
    final lastNameValid =
        Validators.validateLastName(lastNameController.text) == null;
    final nationalIdValid =
        Validators.nationalIdValidator(nationalIdController.text) == null;
    final fatherNameValid =
        Validators.validateFirstName(fatherName.text) == null;

    isFormFilled.value =
        firstNameValid && lastNameValid && nationalIdValid && fatherNameValid;
  }

  Future<void> _submitOwnerForOtherInfo(BuildContext context) async {
    isLoading.value = true;
    final VanOwnerDetailsDto dto = VanOwnerDetailsDto(
      ownerFatherName: fatherName.text,
      ownerFirstName: firstNameController.text,
      ownerLastName: lastNameController.text,
      ownerNationalId: nationalIdController.text,
    );
    final Either<String, VanOwnerDetailsViewModel> resultOrException =
        await _repository.submitOwnerForOtherInfo(dto: dto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
        Get.toNamed(TaxiRouteNames.vanUploadInsurance.uri);
      },
    );
  }

  Future<void> _submitOwnerForSelfInfo(BuildContext context) async {
    isLoading.value = true;
    final Either<String, VanOwnerDetailsViewModel> resultOrException =
        await _repository.submitOwnerForSelfInfo(dto: {'ownership': 'self'});
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
        Get.toNamed(TaxiRouteNames.vanUploadInsurance.uri);
      },
    );
  }

  Future<void> submitUserInfo(BuildContext context) async {
    if (selectedValue.value == 'خودم هستم') {
      await _submitOwnerForSelfInfo(context);
    } else {
      await _submitOwnerForOtherInfo(context);
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalIdController.dispose();
    fatherName.dispose();
    super.onClose();
  }
}
