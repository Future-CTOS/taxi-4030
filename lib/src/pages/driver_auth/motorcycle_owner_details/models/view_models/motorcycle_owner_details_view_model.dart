class MotorcycleOwnerDetailsViewModel {
  final String message;

  const MotorcycleOwnerDetailsViewModel({required this.message});

  factory MotorcycleOwnerDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      MotorcycleOwnerDetailsViewModel(message: json['message']);
}
