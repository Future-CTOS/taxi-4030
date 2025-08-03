import 'package:get/get.dart';

import '../controller/van_upload_insurance_information_controller.dart';

class VanUploadInsuranceInformationBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(() => VanUploadInsuranceInformationController());
}
