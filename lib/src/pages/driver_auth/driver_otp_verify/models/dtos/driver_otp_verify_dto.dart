class DriverOtpVerifyDto {
  final String phone;
  final String otp;

  DriverOtpVerifyDto({required this.phone, required this.otp});

  Map<String, dynamic> toJson() => {"phone": phone, "otp": otp};
}
