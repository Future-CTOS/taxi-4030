import 'package:image_picker/image_picker.dart';

class VideoAuthModel {
  bool isLoading;
  XFile? file;

  VideoAuthModel({this.isLoading = false, this.file});
}
