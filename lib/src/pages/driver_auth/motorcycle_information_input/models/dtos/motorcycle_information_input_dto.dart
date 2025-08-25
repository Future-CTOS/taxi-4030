class MotorcycleInformationInputDto {
  final String licensePlate;
  final String type;
  final String safetyEquipments;
  final String engineCapacity;

  const MotorcycleInformationInputDto({
    required this.licensePlate,
    required this.type,
    required this.safetyEquipments,
    required this.engineCapacity,
  });

  Map<String, dynamic> toJson() => {
    "licensePlate": licensePlate,
    "engineCapacity": engineCapacity,
    "motorType": type,
    "safetyEquipments": safetyEquipments,
  };
}
