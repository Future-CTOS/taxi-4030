import '../../../../infrastructures/app_controller/app_controller.dart';
class CarRegisterDto {
  final String phone;

  const CarRegisterDto({required this.phone});

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "type": AppController.instance.currentVehicle.title,
  };
}
