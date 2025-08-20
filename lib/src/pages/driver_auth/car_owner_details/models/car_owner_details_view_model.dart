class CarOwnerDetailsViewModel {
  final String message;

  const CarOwnerDetailsViewModel({required this.message});

  factory CarOwnerDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      CarOwnerDetailsViewModel(message: json['message']);
}
