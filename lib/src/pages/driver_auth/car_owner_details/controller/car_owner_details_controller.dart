import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/pages/driver_auth/car_owner_details/models/car_owner_details_view_model.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/dtos/car_owner_details_dto.dart';
import '../repository/car_owner_details_repository.dart';

class CarOwnerDetailsController extends GetxController {
  final _repository = CarOwnerDetailsRepository();
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
    final CarOwnerDetailsDto dto = CarOwnerDetailsDto(
      ownerFatherName: fatherName.text,
      ownerFirstName: firstNameController.text,
      ownerLastName: lastNameController.text,
      ownerNationalId: nationalIdController.text,
    );
    final Either<String, CarOwnerDetailsViewModel> resultOrException =
        await _repository.submitOwnerForOtherInfo(dto: dto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) => Utils.showSnackBar(
        context,
        text: response.message,
        status: StatusEnum.success,
      ),
    );
  }

  Future<void> _submitOwnerForSelfInfo(BuildContext context) async {
    isLoading.value = true;
    final Either<String, CarOwnerDetailsViewModel> resultOrException =
        await _repository.submitOwnerForSelfInfo(dto: {'ownership': 'self'});
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) => Utils.showSnackBar(
        context,
        text: response.message,
        status: StatusEnum.success,
      ),
    );
  }

  Future<void> submitUserInfo(BuildContext context) async {
    print(selectedValue.value);
    if (selectedValue.value == 'خودم هستم') {
      await _submitOwnerForSelfInfo(context);
    } else {
      await _submitOwnerForOtherInfo(context);
    }

    Get.toNamed(TaxiRouteNames.carUploadInsurance.uri);
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
