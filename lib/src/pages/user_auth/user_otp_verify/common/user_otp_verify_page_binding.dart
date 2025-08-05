import 'package:get/get.dart';

import '../controller/user_otp_verify_page_controller.dart';

class UserOtpVerifyPageBinding extends Bindings {
  @override
  void dependencies() {
    final String? receivedOtp = Get.parameters['otp'];
    final String? receivedPhone = Get.parameters['phone'];
    Get.lazyPut(
      () => UserOtpVerifyPageController(
        receivedOtp: receivedOtp,
        phoneNumber: receivedPhone,
      ),
    );
  }
}
