// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../../../utilities/utils/colors.dart';
import '../../../../../../utilities/utils/constants.dart';

Widget CategoryCardItem(
    {required String image,
    required String categoryName,
    required double imageHeight}) {
  return Container(
    margin: const EdgeInsets.all(AppConstants.categoryCardMargin),
    child: Card(
      color: AppColors.primary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.categoryCardRadius),
        topRight: Radius.circular(AppConstants.categoryCardRadius),
        bottomLeft: Radius.circular(AppConstants.categoryCardBottomLeftRadius),
        bottomRight: Radius.circular(AppConstants.categoryCardRadius),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center, // add this
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.categoryImageTopRadius),
              topRight: Radius.circular(AppConstants.categoryImageTopRadius),
            ),
            child: Image.network(image,
                // width: 300,
                height: imageHeight,
                fit: BoxFit.cover),
          ),
          Expanded(
            child: Center(
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.buttonTextSize,
                    color: AppColors.whiteColor),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
