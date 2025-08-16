class DriverLicenseUploadViewModel {
  final String message;

  const DriverLicenseUploadViewModel({required this.message});

  factory DriverLicenseUploadViewModel.fromJson(Map<String, dynamic> json) =>
      DriverLicenseUploadViewModel(message: json['message']);
}
