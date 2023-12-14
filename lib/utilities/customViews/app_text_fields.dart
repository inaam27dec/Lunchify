import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

Widget signinTextField({
  required String hint,
  required TextEditingController controller,
  required String? Function(String?) validator,
  required TextInputType textInputType,
  bool upperCaseTextFormatter = false,
}) {
  const Color borderColor = AppColors.primary;
  List<TextInputFormatter>? inputFormatters = [];

  if (upperCaseTextFormatter) {
    inputFormatters.add(UpperCaseTextFormatter());
  }

  return TextFormField(
    controller: controller,
    validator: validator,
    style: const TextStyle(
      color: AppColors.textColor,
    ),
    keyboardType: textInputType,
    inputFormatters: inputFormatters,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      hintText: hint,
      hintStyle: const TextStyle(
        color: AppColors.hintColor,
      ),
    ),
  );
}

Widget signinTextFormField({
  required String hint,
  required TextEditingController controller,
  required String? Function(String?) validator,
  required TextInputType textInputType,
  required Key key,
  bool upperCaseTextFormatter = false,
}) {
  const Color borderColor = AppColors.primary;
  List<TextInputFormatter>? inputFormatters = [];

  if (upperCaseTextFormatter) {
    inputFormatters.add(UpperCaseTextFormatter());
  }

  return Form(
    key: key,
    child: TextFormField(
      controller: controller,
      validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        color: AppColors.textColor,
      ),
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.hintColor,
        ),
      ),
    ),
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
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

Widget renderOrSeparator(BuildContext context) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(color: AppColors.primary, height: 1, width: MediaQuery.of(context).size.width * .37),
        const Text('OR', style: TextStyle(fontSize: AppConstants.buttonTextSize)),
        Container(
          color: AppColors.primary,
          height: 1,
          width: MediaQuery.of(context).size.width * .37,
        ),
      ],
    ),
  );
}
