import '../../../../infrastructures/app_controller/app_controller.dart';
class VanRegisterDto {
  final String phone;

  const VanRegisterDto({required this.phone});

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "type": AppController.instance.currentVehicle.title,
  };
}
