import 'dart:typed_data';

import '../utils/file_bytes/file_bytes_stub.dart';

class FilePickerService {
  Future<Uint8List> readBytes(dynamic file) => getFileBytes(file);

  String extractFileName(dynamic file) => getFileName(file);
}
