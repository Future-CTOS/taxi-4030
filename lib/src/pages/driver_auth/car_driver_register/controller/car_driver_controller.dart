import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/car_register_dto.dart';
import '../repositories/car_driver_repository.dart';

class CarDriverController extends GetxController {
  final _repository = CarDriverRepository();

  final phoneNumberController = TextEditingController();

  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;

  void _checkFormStatus() {
    final phoneNumber =
        Validators.validateMobile(phoneNumberController.text) == null;
    isFormFilled.value = phoneNumber;
  }

  Future<void> requestOtp(BuildContext context) async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    final CarRegisterDto dto = CarRegisterDto(
      phone: phoneNumberController.text,
    );
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.requestOtp(dto: dto);
    isLoading.value = false;
    resultOrException.fold(
      (final error) =>
          Utils.showSnackBar(context, text: error, status: StatusEnum.danger),
      (final response) {
        AppController.instance.phoneNumber = phoneNumberController.text;
        Get.toNamed(TaxiRouteNames.driverOtpVerify.uri);
      },
    );  
  }

  @override
  void onInit() {
    super.onInit();
    phoneNumberController.addListener(_checkFormStatus);
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
