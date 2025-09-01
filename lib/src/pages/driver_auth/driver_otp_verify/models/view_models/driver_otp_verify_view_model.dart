class DriverOtpVerifyViewModel {
  final bool isNew;
  final String? accessToken;
  final String role;

  DriverOtpVerifyViewModel({
    required this.isNew,
    required this.accessToken,
    required this.role,
  });

  factory DriverOtpVerifyViewModel.fromJson(final Map<String, dynamic> json) =>
      DriverOtpVerifyViewModel(
        accessToken: json['access_token'],
        isNew: json['isRegistered'] ?? false,
        role: json['driver'] ?? 'driver',
      );
}
