import 'dart:async';

import 'package:get/get.dart';

class OtpVerifyPageController extends GetxController {
  RxInt totalSeconds = 10.obs;
  RxBool expired = false.obs;
  RxBool isExpired = false.obs;
  RxBool isResendEnabled = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    totalSeconds.value = 10;
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

  void resendOtp() {
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

  void backToInputNumberPage() => Get.back();
}
