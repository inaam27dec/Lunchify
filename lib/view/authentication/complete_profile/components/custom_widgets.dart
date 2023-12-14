import 'package:flutter/material.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';



/*
Widget signupTextField({
  required String hint,
  required TextEditingController controller,
  required String? Function(String?) validator,
  required TextInputType textInputType,
  bool upperCaseTextFormatter = false,
}) {
  const Color textColor = Colors.white;
  const Color borderColor = CustomColors.primary;
  List<TextInputFormatter>? inputFormatters = [];

  if (upperCaseTextFormatter) {
    inputFormatters.add(UpperCaseTextFormatter());
  }

  return TextFormField(
    controller: controller,
    validator: validator,
    inputFormatters: inputFormatters,
    style: const TextStyle(
      color: textColor,
    ),
    keyboardType: textInputType,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      filled: true,
      fillColor: borderColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      hintText: hint,
      hintStyle: const TextStyle(
        color: textColor,
      ),
    ),
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
*/

