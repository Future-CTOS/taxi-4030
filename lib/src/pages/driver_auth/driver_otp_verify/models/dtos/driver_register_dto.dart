import '../../../../../infrastructures/app_controller/app_controller.dart';

class DriverRegisterDto {
  final String phone;

  const DriverRegisterDto({required this.phone});

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "type": AppController.instance.currentVehicle.title,
  };
}
