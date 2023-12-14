import 'package:flutter/material.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';

import '../../../lunch_portal.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

showHideDialog(BuildContext context, bool isShow) {
  if (isShow) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  } else {
    Navigator.of(context).pop();
  }
}

showLogoutAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(
        color: AppColors.textColor,
      ),
    ),
    onPressed: () => Navigator.pop(context),
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Logout",
    ),
    onPressed: () {
      LunchPortal.authViewModel.logoutUser();
      Navigator.pushNamed(context, RouteConstants.loginRoute);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Logout",
    ),
    content: const Text(
      "Are you sure to logout?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showEditAlertDialog(BuildContext context, Function function) {
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(
        color: AppColors.textColor,
      ),
    ),
    onPressed: () => Navigator.pop(context),
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Edit",
    ),
    onPressed: () {
      function();
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Confirmation",
    ),
    content: const Text(
      "Are you sure to Edit your Profile?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> showConfirmationDialog(context, String title, String description,
    int index, Function(int) onPressedYes) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
                fontSize: AppConstants.buttonTextSize)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(description,
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: AppConstants.buttonTextSize)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    fontSize: AppConstants.buttonTextSize)),
            onPressed: () {
              Navigator.of(context).pop();
              onPressedYes(index);
            },
          ),
          TextButton(
            child: const Text('No',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    fontSize: AppConstants.buttonTextSize)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}

showDeleteItemAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(
        color: AppColors.textColor,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Remove",
    ),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Confirmation",
    ),
    content: const Text(
      "Are you sure to Remove this from Order?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
