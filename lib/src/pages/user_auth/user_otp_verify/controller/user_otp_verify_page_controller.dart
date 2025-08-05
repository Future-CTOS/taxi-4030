import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taxi_4030/src/pages/shared/model/enum/status_enum.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../model/otp_verify_dto.dart';
import '../model/user_register_dto.dart';
import '../repository/otp_verify_page_repository.dart';

class UserOtpVerifyPageController extends GetxController {
  final _repository = OtpVerifyPageRepository();

  UserOtpVerifyPageController({
    required this.receivedOtp,
    required this.phoneNumber,
  });

  String? receivedOtp;
  String? phoneNumber;

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

  Future<void> verifyOtp({
    required BuildContext context,
    required String value,
  }) async {
    isLoading.value = true;
    final OtpVerifyDto registerDto = OtpVerifyDto(
      phone: phoneNumber ?? '',
      otp: receivedOtp ?? '',
    );
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.verifyOtp(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final _) => Utils.showSnackBar(
        context,
        text: 'خطایی رخ داد',
        status: StatusEnum.danger,
      ),
      (final response) {
        Get.offAndToNamed(TaxiRouteNames.userRegister.uri);
        Utils.showSnackBar(
          Get.context!,
          text: 'خوش آمدید',
          status: StatusEnum.success,
        );
      },
    );
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

  Future<void> _requestOtp(BuildContext context) async {
    isLoading.value = true;
    final UserRegisterDto registerDto = UserRegisterDto(
      phone: phoneNumber ?? '',
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
      (final response) {
        print('respone in resend otp: $response');
      },
    );
  }

  Future<void> resendOtp(BuildContext context) async {
    if (!isResendEnabled.value) return;

    _requestOtp(context);

    _startTimer();
  }

  String formattedTime() {
    final m = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void backToInputNumberPage() => Get.back();
}
