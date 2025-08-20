import 'package:image_picker/image_picker.dart';

class CarSelfieAuthInformationModel {
  bool isLoading;
  XFile? file;

  CarSelfieAuthInformationModel({this.isLoading = false, this.file});
}
