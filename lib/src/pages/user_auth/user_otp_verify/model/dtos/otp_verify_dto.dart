class OtpVerifyDto {
  final String phone;
  final String otp;

  OtpVerifyDto({required this.phone, required this.otp});

  Map<String, dynamic> toJson() => {"phone": phone, "otp": otp};
}
