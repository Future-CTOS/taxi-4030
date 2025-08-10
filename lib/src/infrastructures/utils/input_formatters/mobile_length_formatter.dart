import 'package:flutter/services.dart';

class MobileLengthFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (!RegExp(r'^[0-9]*$').hasMatch(text)) {
      return oldValue;
    }

    if (text.startsWith('0')) {
      if (text.length > 11) {
        return oldValue;
      }
    } else {
      if (text.length > 10) {
        return oldValue;
      }
    }

    return newValue;
  }
}
