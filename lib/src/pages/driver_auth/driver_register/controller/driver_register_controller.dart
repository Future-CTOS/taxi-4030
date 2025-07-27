import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../models/vehicle_model.dart';

class DriverRegisterController extends GetxController {
  final List<VehicleModel> vehicles = [
    VehicleModel(
      title: 'خودرو',
      imagePath: 'assets/car.png',
      uriRoute: TaxiRouteNames.carDriverRegister.uri,
    ),
    VehicleModel(
      title: 'موتور',
      imagePath: 'assets/motorcycle.png',
      uriRoute: TaxiRouteNames.motorcycleRegister.uri,
    ),
    VehicleModel(
      title: 'وانت',
      imagePath: 'assets/van.png',
      uriRoute: TaxiRouteNames.vanDriverRegister.uri,
    ),
  ];
}
