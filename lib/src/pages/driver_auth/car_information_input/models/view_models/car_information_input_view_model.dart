class CarInformationInputViewModel {
  final List<dynamic> carModels;
  final List<dynamic> carYears;
  final List<dynamic> carColors;

  const CarInformationInputViewModel({
    required this.carModels,
    required this.carYears,
    required this.carColors,
  });

  factory CarInformationInputViewModel.fromJson(Map<String, dynamic> json) =>
      CarInformationInputViewModel(
        carColors: json['carColors'],
        carModels: json['carModels'],
        carYears: json['carYears'],
      );
}
