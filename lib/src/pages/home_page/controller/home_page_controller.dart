import 'package:get/get.dart';

import '../../../infrastructures/routes/route_names.dart';

class HomePageController extends GetxController {
  Future<void> navigateToTripPage() async =>
      await Get.toNamed(TaxiRouteNames.tripPage.uri);
}
