import 'package:get/get.dart';

import '../controller/motorcycle_upload_insurance_information_controller.dart';

class MotorcycleUploadInsuranceInformationBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(() => MotorcycleUploadInsuranceInformationController());
}
