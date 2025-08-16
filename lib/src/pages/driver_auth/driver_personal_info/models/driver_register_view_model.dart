class DriverPersonalInfoViewModel {
  final String message;

  const DriverPersonalInfoViewModel({required this.message});

  factory DriverPersonalInfoViewModel.fromJson(Map<String, dynamic> json) =>
      DriverPersonalInfoViewModel(message: json['message']);
}
