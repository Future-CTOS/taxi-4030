import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/driver_personal_info_dto.dart';
import '../models/driver_register_view_model.dart';
import '../repository/driver_personal_info_repository.dart';

class DriverPersonalInfoController extends GetxController {
  final _repository = CarDriverRegisterRepository();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nationalCodeController = TextEditingController();
  final nationalIdController = TextEditingController();
  final fatherName = TextEditingController();
  Rx<DateTime> dateTimeSelected = Rx<DateTime>(DateTime.now());

  final isFormFilled = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_checkFormStatus);
    lastNameController.addListener(_checkFormStatus);
    nationalCodeController.addListener(_checkFormStatus);
    nationalIdController.addListener(_checkFormStatus);
    fatherName.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final firstNameValid =
        Validators.validateFirstName(firstNameController.text) == null;
    final lastNameValid =
        Validators.validateLastName(lastNameController.text) == null;
    final nationalCodeValid =
        Validators.nationalCodeValidator(nationalCodeController.text) == null;

    final nationalIdValid =
        Validators.nationalIdValidator(nationalIdController.text) == null;
    final fatherNameValid =
        Validators.validateFirstName(fatherName.text) == null;

    isFormFilled.value =
        firstNameValid &&
        lastNameValid &&
        nationalCodeValid &&
        nationalIdValid &&
        fatherNameValid;
  }

  Future<void> _driverPersonalInfo(BuildContext context) async {
    isLoading.value = true;
    final d = dateTimeSelected.value;
    final birthday =
        "${d.year.toString().padLeft(4, '0')}-"
        "${d.month.toString().padLeft(2, '0')}-"
        "${d.day.toString().padLeft(2, '0')} "
        "${d.hour.toString().padLeft(2, '0')}:"
        "${d.minute.toString().padLeft(2, '0')}:"
        "${d.second.toString().padLeft(2, '0')}."
        "${d.millisecond.toString().padLeft(3, '0')}";
    final DriverPersonalInfoDto registerDto = DriverPersonalInfoDto(
      name: firstNameController.text,
      lastName: lastNameController.text,
      fatherName: fatherName.text,
      shenasnameh: nationalIdController.text,
      nationalCode: nationalCodeController.text,
      birthday: birthday,
    );
    final Either<String, DriverPersonalInfoViewModel> resultOrException =
        await _repository.userRegister(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        print(response);
        Get.offAndToNamed(TaxiRouteNames.driverActivityInfo.uri);
      },
    );
  }

  Future<void> submitUserInfo(BuildContext context) async {
    if (!isFormFilled.value) return;
    try {
      await _driverPersonalInfo(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalCodeController.dispose();
    nationalIdController.dispose();
    fatherName.dispose();

    super.onClose();
  }
}
