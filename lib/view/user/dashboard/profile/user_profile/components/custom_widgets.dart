import 'package:flutter/material.dart';
import '../../../../../../utilities/utils/colors.dart';
import '../../../../../../utilities/utils/constants.dart';

Widget profileTile({required icon, required content}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 15, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 26,
              color: AppColors.primary,
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                content,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
      const Divider(
        height: 0.5,
        color: Colors.grey,
      ),
      const Divider(
        height: 1.5,
        color: Colors.transparent,
      ),
    ],
  );
}
