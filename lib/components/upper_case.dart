import 'package:flutter/services.dart';

class UpperCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.toUpperCase();
    int newSelectionIndex = newValue.selection.baseOffset;
    if (newText.isNotEmpty && newSelectionIndex > newText.length) {
      newSelectionIndex = newText.length;
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}

class LowerCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.toLowerCase();
    int newSelectionIndex = newValue.selection.baseOffset;
    if (newText.isNotEmpty && newSelectionIndex > newText.length) {
      newSelectionIndex = newText.length;
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}
