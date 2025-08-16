import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;

Future<Uint8List> getFileBytes(File file) => file.readAsBytes();
String getFileName(File file) => path.basename(file.path);
