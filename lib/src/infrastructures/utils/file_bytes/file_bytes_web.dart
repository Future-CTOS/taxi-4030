import 'dart:async';
import 'dart:typed_data';
import 'dart:html' as html;

Future<Uint8List> getFileBytes(html.File file) {
  final completer = Completer<Uint8List>();
  final reader = html.FileReader();

  reader.onLoad.listen((event) {
    final result = reader.result;
    if (result is Uint8List) {
      completer.complete(result);
    } else if (result is ByteBuffer) {
      completer.complete(result.asUint8List());
    } else {
      completer.completeError('Failed to read file as bytes');
    }
  });

  reader.onError.listen((error) {
    completer.completeError(error);
  });

  reader.readAsArrayBuffer(file);
  return completer.future;
}

String getFileName(html.File file) => file.name;
