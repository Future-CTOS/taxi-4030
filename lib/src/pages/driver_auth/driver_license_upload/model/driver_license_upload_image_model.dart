import 'package:image_picker/image_picker.dart';

class DriverLicenseUploadImageModel {
  bool isLoading;
  XFile? file;

  DriverLicenseUploadImageModel({this.isLoading = false, this.file});
}
