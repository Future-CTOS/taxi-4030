class MotorcycleInformationInputViewModel {
  final List<dynamic> motorcycleTypes;
  final List<dynamic> motorcycleCapacityEngine;

  const MotorcycleInformationInputViewModel({
    required this.motorcycleTypes,
    required this.motorcycleCapacityEngine,
  });

  factory MotorcycleInformationInputViewModel.fromJson(
    Map<String, dynamic> json,
  ) => MotorcycleInformationInputViewModel(
    motorcycleCapacityEngine: json['motorCapacities'],
    motorcycleTypes: json['motorTypes'],
  );
}
