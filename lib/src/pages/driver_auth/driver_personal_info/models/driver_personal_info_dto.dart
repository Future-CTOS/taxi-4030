class DriverPersonalInfoDto {
  final String name;
  final String lastName;
  final String shenasnameh;
  final String nationalCode;
  final String birthday;
  final String fatherName;

  const DriverPersonalInfoDto({
    required this.name,
    required this.lastName,
    required this.shenasnameh,
    required this.nationalCode,
    required this.birthday,
    required this.fatherName,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastname": lastName,
    'shenasnameh': shenasnameh,
    "nationalCode": nationalCode,
    "birthday": birthday,
    "fatherName": fatherName,
  };
}
