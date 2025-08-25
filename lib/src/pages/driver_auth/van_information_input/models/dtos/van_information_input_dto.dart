class VanInformationInputDto {
  final String licensePlate;
  final String type;
  final String modelYear;
  final String color;

  const VanInformationInputDto({
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
