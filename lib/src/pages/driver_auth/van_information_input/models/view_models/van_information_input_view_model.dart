class VanInformationInputViewModel {
  final List<dynamic> vanTypes;
  final List<dynamic> vanYears;
  final List<dynamic> vanColors;
  final List<dynamic> vanLoadCapacities;

  const VanInformationInputViewModel({
    required this.vanTypes,
    required this.vanYears,
    required this.vanColors,
    required this.vanLoadCapacities,
  });

  factory VanInformationInputViewModel.fromJson(Map<String, dynamic> json) =>
      VanInformationInputViewModel(
        vanColors: json['vanetColors'],
        vanLoadCapacities: json['vanetLoadCapacity'],
        vanTypes: json['vanetModels'],
        vanYears: json['vanetYears'],
      );
}
