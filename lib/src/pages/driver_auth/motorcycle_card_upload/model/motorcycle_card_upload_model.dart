import 'package:image_picker/image_picker.dart';

class MotorcycleCardUploadModel {
  bool isLoading;
  XFile? file;

  MotorcycleCardUploadModel({this.isLoading = false, this.file});
}
