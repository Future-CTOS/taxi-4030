class CarInformationInputDto {
  final String licensePlate;
  final String model;
  final String year;
  final String color;

  CarInformationInputDto({
    required this.licensePlate,
    required this.model,
    required this.year,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
    "licensePlate": licensePlate,
    "model": model,
    "year": year,
    "color": color,
  };

  @override
  String toString() =>
      'CarInformationInputDto{licensePlate: $licensePlate, model: $model, year: $year, color: $color}';
}