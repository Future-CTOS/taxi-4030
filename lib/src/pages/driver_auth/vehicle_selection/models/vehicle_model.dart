import '../../../../infrastructures/commons/current_vehicle.dart';

class VehicleModel {
  final String title;
  final String imagePath;
  final String uriRoute;
  final VehicleType vehicleType;

  const VehicleModel({
    required this.title,
    required this.imagePath,
    required this.uriRoute,
    required this.vehicleType,
  });
}
