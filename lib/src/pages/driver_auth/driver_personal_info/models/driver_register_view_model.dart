class DriverRegisterViewModel {
  final String accessToken;
  final String role;

  DriverRegisterViewModel({required this.role, required this.accessToken});

  factory DriverRegisterViewModel.fromJson(final Map<String, dynamic> json) =>
      DriverRegisterViewModel(
        accessToken: json['access_token'],
        role: json['role'],
      );
}
