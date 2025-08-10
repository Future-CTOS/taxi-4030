class OtpVerifyViewModel {
  final bool isRegistered;
  final String? accessToken;

  OtpVerifyViewModel({required this.isRegistered, required this.accessToken});

  factory OtpVerifyViewModel.fromJson(final Map<String, dynamic> json) =>
      OtpVerifyViewModel(
        accessToken: json['access_token'],
        isRegistered: json['isRegistered'],
      );
}
