import 'package:get/get.dart';

import '../controller/driver_otp_verify_controller.dart';

class DriverOtpVerifyBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverOtpVerifyController());
}
