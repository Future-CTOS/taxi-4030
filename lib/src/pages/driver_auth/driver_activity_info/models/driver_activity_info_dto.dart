class DriverPersonalInfoDto {
  final String address;
  final String refCode;
  final String city;

  const DriverPersonalInfoDto({
    required this.city,
    required this.refCode,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
    "city": city,
    "address": address,
    "refCode": refCode,
  };

  @override
  String toString() => '$city $address $refCode';
}
