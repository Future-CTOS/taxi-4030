class LogInDto {
  final String mobile;

  LogInDto({required this.mobile});

  Map<String, dynamic> toJson() => {"mobile": mobile};
}
