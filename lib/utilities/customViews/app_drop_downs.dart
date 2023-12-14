import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

Widget customDropDownTile(
    {required String title, required Widget child, required bool showError}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: AppConstants.borderWidth,
            color: AppColors.primary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15, right: 17, top: 3.75, bottom: 3.75),
          child: child,
        ),
      ),
      const SizedBox(
        height: 7,
      ),
      showError
          ? const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Please Select One',
                style: TextStyle(
                  color: AppColors.errorColor,
                  fontSize: 13,
                ),
              ),
            )
          : Container(),
    ],
  );
}
