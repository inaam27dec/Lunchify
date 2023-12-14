import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';


class PasswordField extends StatefulWidget {
  const PasswordField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.validator})
      : super(key: key);

  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  State<StatefulWidget> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: !_passwordVisible,
      style: const TextStyle(
        color: AppColors.textColor,
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.textColor,
          ),
          onPressed: () {
            setState(
              () {
                _passwordVisible = !_passwordVisible;
              },
            );
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppConstants.borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppConstants.borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppConstants.borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppConstants.borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: AppColors.hintColor),
      ),
    );
  }
}
