import '../../../../infrastructures/app_controller/app_controller.dart';

class MotorcycleRegisterDto {
  final String phone;

  const MotorcycleRegisterDto({required this.phone});

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "type": AppController.instance.currentVehicle.title,
  };
}
