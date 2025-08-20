import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/pages/driver_auth/motorcycle_driver_register/models/motorcycle_register_dto.dart';
import 'package:http/http.dart' as http;
import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../repositories/motorcycle_driver_repository.dart';

class MotorcycleDriverController extends GetxController {
  final phoneNumberController = TextEditingController();
  final _repository = MotorcycleDriverRepository();
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
    final MotorcycleRegisterDto dto = MotorcycleRegisterDto(
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

  Future<void> submitUserInfo(BuildContext context) async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    await requestOtp(context);
    isLoading.value = false;
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
