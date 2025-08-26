class MotorcycleOwnerDetailsDto {
  final String ownerFirstName;
  final String ownerLastName;
  final String ownerNationalId;
  final String ownerFatherName;

  const MotorcycleOwnerDetailsDto({
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.ownerNationalId,
    required this.ownerFatherName,
  });

  Map<String, dynamic> toJson() => {
    "ownership": "other",
    "ownerFirstName": ownerFirstName,
    "ownerLastName": ownerLastName,
    "ownerNationalId": ownerNationalId,
    "ownerFatherName": ownerFatherName,
  };
}
