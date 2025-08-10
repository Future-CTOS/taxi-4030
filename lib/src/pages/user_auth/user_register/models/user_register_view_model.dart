class UserRegisterViewModel {
  final String accessToken;
  final String role;

  UserRegisterViewModel({required this.role, required this.accessToken});

  factory UserRegisterViewModel.fromJson(final Map<String, dynamic> json) =>
      UserRegisterViewModel(
        accessToken: json['access_token'],
        role: json['role'],
      );
}
