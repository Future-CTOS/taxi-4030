import 'package:get/get.dart';

import '../controller/driver_license_upload_controller.dart';

class DriverLicenseUploadBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverLicenseUploadController());
}
