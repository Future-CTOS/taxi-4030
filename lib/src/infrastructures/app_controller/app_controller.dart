import 'package:get_storage/get_storage.dart';

import '../commons/current_vehicle.dart';

class AppController {
  AppController._();

  static final AppController instance = AppController._();

  //
  // static final AppController _instance = AppController._();

  final storage = GetStorage();

  late final String fullBaseUrl;
  String? userToken;
  String? driverToken;
  VehicleType currentVehicle = VehicleType.car;
  String? phoneNumber;
}
