import 'package:flutter/material.dart';

import '../../lunch_portal.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

Widget googleSignInButton({required String text, required onPressed, required context}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      side: const BorderSide(
        width: AppConstants.borderWidth,
        color: AppColors.primary,
      ),
      shape: const StadiumBorder(),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppConstants.googleLogoPath,
          width: 32,
          height: 32,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        SizedBox(
          height: AppConstants.buttonSize,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: AppConstants.buttonTextSize,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget submitButton({required String text, required onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
    ),
    child: SizedBox(
      height: AppConstants.buttonSize,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: AppConstants.buttonTextSize,
          ),
        ),
      ),
    ),
  );
}

Widget submitOutlineButton({required String text, required onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      side: const BorderSide(width: 2.0, color: AppColors.primary),
      shape: const StadiumBorder(),
    ),
    child: SizedBox(
      height: AppConstants.buttonSize,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: AppConstants.buttonTextSize,
          ),
        ),
      ),
    ),
  );
}

Widget submitWideButton({required String text, required double buttonSize, required onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
    ),
    child: SizedBox(
      width: buttonSize,
      height: 45,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: AppConstants.buttonTextSize,
          ),
        ),
      ),
    ),
  );
}

Widget submitWideOutlineButton({required String text, required double buttonSize, required onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      side: const BorderSide(width: 2.0, color: AppColors.primary),
      shape: const StadiumBorder(),
    ),
    child: SizedBox(
      width: buttonSize,
      height: 50,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: AppConstants.buttonTextSize,
          ),
        ),
      ),
    ),
  );
}

Widget submitWideWhiteOutlineButton({required String text, required double buttonSize, required onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      side: const BorderSide(width: 2.0, color: Colors.white),
      shape: const StadiumBorder(),
    ),
    child: SizedBox(
      width: buttonSize,
      height: 25,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppConstants.buttonTextSize,
          ),
        ),
      ),
    ),
  );
}

Widget submitTextButton({required String text, required onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text),
  );
}

Widget renderGoogleButton(BuildContext context, String buttonText) {
  return googleSignInButton(
    onPressed: () async {
      await LunchPortal.loginHelper.onClickLogin(isGoogle: true, context: context);
    },
    text: buttonText,
    context: context,
  );
}
