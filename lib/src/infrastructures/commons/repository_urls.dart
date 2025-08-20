class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'https://taxi-4030.ir';
  static const String _userAuth = '/auth';
  static const String _driverAuth = '/driver-auth';
  static const String _driverRegister = '/driver';
  static const String _vehicle = '/vehicle';
  static const String _vehicleOptions = '/vehicle-options';

  static Uri userRequestOtp = Uri.parse('$_baseUrl$_userAuth/request-otp');
  static Uri userVerifyOtp = Uri.parse('$_baseUrl$_userAuth/verify-otp');
  static Uri userRegister = Uri.parse(
    '$_baseUrl$_userAuth/complete-registration',
  );

  static Uri driverRequestOtp = Uri.parse('$_baseUrl$_driverAuth/request-otp');
  static Uri driverVerifyOtp = Uri.parse('$_baseUrl$_driverAuth/verify-otp');

  static Uri driverPersonalInfo = Uri.parse(
    '$_baseUrl$_driverRegister/step1-basic',
  );
  static Uri driverActivityInfo = Uri.parse(
    '$_baseUrl$_driverRegister/step2-location',
  );
  static Uri driverLicenseUploadFront = Uri.parse(
    '$_baseUrl$_driverRegister/step3-license-front',
  );

  static Uri driverLicenseUploadBack = Uri.parse(
    '$_baseUrl$_driverRegister/step4-license-back',
  );
  static Uri driverSelfieUpload = Uri.parse(
    '$_baseUrl$_driverRegister/step5-selfie',
  );
  static Uri driverVideoUpload = Uri.parse(
    '$_baseUrl$_driverRegister/step6-video',
  );

  static Uri driverSubmit = Uri.parse('$_baseUrl$_driverRegister/step6-video');

  static Uri driverUploadCarCardFront = Uri.parse(
    '$_baseUrl$_vehicle/upload-car-card-front',
  );

  static Uri driverUploadCarCardBack = Uri.parse(
    '$_baseUrl$_vehicle/upload-car-card-back',
  );

  static Uri submitOwnerInfo = Uri.parse(
    '$_baseUrl$_vehicle/submit-owner-info',
  );

  static Uri driverSubmitCarInfo = Uri.parse('$_baseUrl$_vehicle/car/submit');

  static Uri driverSubmitVanInfo = Uri.parse('$_baseUrl$_vehicle/vanet/submit');

  static Uri driverSubmitMotorcycleInfo = Uri.parse(
    '$_baseUrl$_vehicle/motor/submit',
  );

  static Uri driverGetCarInfo = Uri.parse('$_baseUrl$_vehicleOptions/car');

  static Uri driverGetVanInfo = Uri.parse('$_baseUrl$_vehicleOptions/vanet');

  static Uri driverGetMotorcycleInfo = Uri.parse(
    '$_baseUrl$_vehicleOptions/motor',
  );

  static Uri uploadInsurance = Uri.parse('$_baseUrl$_vehicle/upload-insurance');

  static Uri checkConnection = Uri.parse(_baseUrl);

  static String getImage({required String folder, required String image}) =>
      '`/account/uploaded-image/$folder/$image';
}
