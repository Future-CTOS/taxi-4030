class DriverActivityInfoViewModel {
  final String message;

  const DriverActivityInfoViewModel({required this.message});

  factory DriverActivityInfoViewModel.fromJson(Map<String, dynamic> json) =>
      DriverActivityInfoViewModel(message: json['message']);
}
