import 'package:flutter/services.dart';

class SerialNumberFormatter extends TextInputFormatter {
 @override
 TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text;
    StringBuffer buffer = StringBuffer();
    int hyphenCount = 0;
    for (int i = 0; i < enteredData.length; i++) {
      if (enteredData[i] == '-') {
        hyphenCount++;
      } else {
        buffer.write(enteredData[i]);
        if ((buffer.length - hyphenCount) % 4 == 0 && enteredData.length != i + 1) {
          buffer.write('-');
        }
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
 }
}
