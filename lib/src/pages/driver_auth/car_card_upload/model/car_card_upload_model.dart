import 'package:image_picker/image_picker.dart';

class CarCardUploadModel {
  bool isLoading;
  XFile? file;

  CarCardUploadModel({this.isLoading = false, this.file});
}
