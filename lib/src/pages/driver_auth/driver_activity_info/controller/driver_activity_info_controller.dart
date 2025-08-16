import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/driver_activity_info_dto.dart';
import '../models/driver_activity_info_view_model.dart';
import '../repository/driver_activity_info_repository.dart';

class DriverActivityInfoController extends GetxController {
  final _repository = DriverActivityInfoRepository();
  final referralCode = TextEditingController();
  final address = TextEditingController();
  final cityActivity = TextEditingController();

  final isFormFilled = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    cityActivity.addListener(_checkFormStatus);
    address.addListener(_checkFormStatus);
    referralCode.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final cityActivityValid =
        Validators.validateCityActivity(cityActivity.text) == null;
    final addressValid = Validators.validateAddress(address.text) == null;
    final referralCodeValid =
        Validators.validateReferralCode(referralCode.text) == null;

    isFormFilled.value = cityActivityValid && addressValid && referralCodeValid;
  }

  Future<void> _driverPersonalInfo(BuildContext context) async {
    isLoading.value = true;
    final DriverPersonalInfoDto registerDto = DriverPersonalInfoDto(
      city: cityActivity.text,
      address: address.text,
      refCode: referralCode.text,
    );
    final Either<String, DriverActivityInfoViewModel> resultOrException =
        await _repository.userRegister(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Get.offAndToNamed(TaxiRouteNames.driverLicenseUpload.uri);
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
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
    cityActivity.dispose();
    address.dispose();
    referralCode.dispose();
    super.onClose();
  }
}
