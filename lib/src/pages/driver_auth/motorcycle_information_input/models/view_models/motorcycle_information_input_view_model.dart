class MotorcycleInformationInputViewModel {
  final List<dynamic> carModels;
  final List<dynamic> carYears;
  final List<dynamic> carColors;

  const MotorcycleInformationInputViewModel({
    required this.carModels,
    required this.carYears,
    required this.carColors,
  });

  factory MotorcycleInformationInputViewModel.fromJson(Map<String, dynamic> json) =>
      MotorcycleInformationInputViewModel(
        carColors: json['carColors'],
        carModels: json['carModels'],
        carYears: json['carYears'],
      );
}
