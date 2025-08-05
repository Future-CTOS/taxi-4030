class UserRegisterDto {
  final String phone;

  const UserRegisterDto({required this.phone});

  Map<String, dynamic> toJson() => {"phone": phone};
}
