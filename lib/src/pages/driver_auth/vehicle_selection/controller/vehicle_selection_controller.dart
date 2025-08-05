import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/commons/current_vehicle.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../models/vehicle_model.dart';

class VehicleSelectionController extends GetxController {
  final List<VehicleModel> vehicles = [
    VehicleModel(
      title: 'خودرو',
      imagePath: Assets.pngs.car.path,
      uriRoute: TaxiRouteNames.carDriverRegister.uri,
      vehicleType: VehicleType.car,
    ),
    VehicleModel(
      title: 'موتور',
      imagePath: Assets.pngs.motorcycle.path,
      uriRoute: TaxiRouteNames.motorcycleRegister.uri,
      vehicleType: VehicleType.motoCycle,
    ),
    VehicleModel(
      title: 'وانت',
      imagePath: Assets.pngs.van.path,
      uriRoute: TaxiRouteNames.vanDriverRegister.uri,
      vehicleType: VehicleType.van,
    ),
  ];
}
