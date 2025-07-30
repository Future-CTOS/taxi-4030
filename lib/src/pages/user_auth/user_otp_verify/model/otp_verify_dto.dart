class OtpVerifyDto {
  final String mobile;

  OtpVerifyDto({required this.mobile});

  Map<String, dynamic> toJson() => {"mobile": mobile};
}
