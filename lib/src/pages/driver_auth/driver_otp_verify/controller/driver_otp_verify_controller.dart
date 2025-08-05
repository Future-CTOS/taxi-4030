import 'dart:async';

import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';

class DriverOtpVerifyController extends GetxController {

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

  void onCompletedFiled(String value) {
    Get.offAndToNamed(TaxiRouteNames.driverPersonalInfo.uri);
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

  Future<void> resendOtp() async {
    if (!isResendEnabled.value) return;

    /// todo: call otp api

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

}
