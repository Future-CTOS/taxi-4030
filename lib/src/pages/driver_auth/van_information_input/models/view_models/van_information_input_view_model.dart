class VanInformationInputViewModel {
  final List<dynamic> carModels;
  final List<dynamic> carYears;
  final List<dynamic> carColors;

  const VanInformationInputViewModel({
    required this.carModels,
    required this.carYears,
    required this.carColors,
  });

  factory VanInformationInputViewModel.fromJson(Map<String, dynamic> json) =>
      VanInformationInputViewModel(
        carColors: json['carColors'],
        carModels: json['carModels'],
        carYears: json['carYears'],
      );
}
