import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../models/vehicle_model.dart';

class VehicleSelectionController extends GetxController {
  final List<VehicleModel> vehicles = [
    VehicleModel(
      title: 'خودرو',
      imagePath: Assets.pngs.car.path,
      uriRoute: TaxiRouteNames.carDriverRegister.uri,
    ),
    VehicleModel(
      title: 'موتور',
      imagePath: Assets.pngs.motorcycle.path,
      uriRoute: TaxiRouteNames.motorcycleRegister.uri,
    ),
    VehicleModel(
      title: 'وانت',
      imagePath: Assets.pngs.van.path,
      uriRoute: TaxiRouteNames.vanDriverRegister.uri,
    ),
  ];
}
