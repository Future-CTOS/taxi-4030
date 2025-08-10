class DriverOtpVerifyViewModel {
  final bool isRegistered;
  final String? accessToken;

  DriverOtpVerifyViewModel({
    required this.isRegistered,
    required this.accessToken,
  });

  factory DriverOtpVerifyViewModel.fromJson(final Map<String, dynamic> json) =>
      DriverOtpVerifyViewModel(
        accessToken: json['access_token'],
        isRegistered: json['isRegistered'],
      );
}
