class CarInformationInputDto {
  final String licensePlate;
  final String type;
  final String modelYear;
  final String color;

  const CarInformationInputDto({
    required this.licensePlate,
    required this.type,
    required this.modelYear,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
    "licensePlate": licensePlate,
    "model": type,
    "year": modelYear,
    "color": color,
  };
}
