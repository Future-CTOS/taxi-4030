class UserRegisterDto {
  final String phone;
  final String firstName;
  final String lastName;
  final String nationalCode;
  final String birthday;
  final String referralCode;

  const UserRegisterDto({
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.nationalCode,
    required this.birthday,
    required this.referralCode,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "firstName": firstName,
    "lastName": lastName,
    "nationalCode": nationalCode,
    "birthday": birthday,
    "referralCode": referralCode,
  };
}
