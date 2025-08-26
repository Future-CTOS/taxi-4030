import 'package:image_picker/image_picker.dart';

class VanCardUploadModel {
  bool isLoading;
  XFile? file;

  VanCardUploadModel({this.isLoading = false, this.file});
}
