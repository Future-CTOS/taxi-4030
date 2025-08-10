import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/dtos/driver_otp_verify_dto.dart';
import '../models/dtos/driver_register_dto.dart';
import '../models/view_models/driver_otp_verify_view_model.dart';
import '../repository/driver_otp_verify_repository.dart';

class DriverOtpVerifyController extends GetxController {
  final _repository = DriverOtpVerifyRepository();

  RxInt totalSeconds = 30.obs;
  RxBool expired = false.obs;
  RxBool isExpired = false.obs;
  RxBool isResendEnabled = false.obs;
  RxBool isLoading = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    totalSeconds.value = 30;
    isExpired.value = false;
    isResendEnabled.value = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (totalSeconds.value > 0) {
        totalSeconds.value--;
      } else {
        timer.cancel();
        isExpired.value = true;
        isResendEnabled.value = true;
      }
    });
  }

  Future<void> verifyOtp({
    required BuildContext context,
    required String value,
  }) async {
    isLoading.value = true;
    final DriverOtpVerifyDto registerDto = DriverOtpVerifyDto(
      phone: AppController.instance.phoneNumber!,
      otp: value,
    );
    final Either<String, DriverOtpVerifyViewModel> resultOrException =
        await _repository.verifyOtp(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        _navigateToNextPage(response.isRegistered);
        Utils.showSnackBar(
          Get.context!,
          text: 'خوش آمدید',
          status: StatusEnum.success,
        );
      },
    );
  }

  Future<void> _requestOtp(BuildContext context) async {
    isLoading.value = true;
    final DriverRegisterDto registerDto = DriverRegisterDto(
      phone: AppController.instance.phoneNumber!,
    );
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.requestOtp(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final _) => Utils.showSnackBar(
        context,
        text: 'خطایی رخ داد',
        status: StatusEnum.danger,
      ),
      (final _) => Left.new,
    );
  }

  Future<void> resendOtp(BuildContext context) async {
    if (!isResendEnabled.value) return;
    await _requestOtp(context);

    _startTimer();
  }

  String formattedTime() {
    final m = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _navigateToNextPage(bool isRegistered) {
    if (isRegistered) {
      Get.offAndToNamed(TaxiRouteNames.profile.uri);
      return;
    }

    Get.offAndToNamed(TaxiRouteNames.driverPersonalInfo.uri);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
