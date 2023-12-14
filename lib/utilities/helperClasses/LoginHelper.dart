import 'package:flutter/material.dart';
import 'package:lunch_portal/utilities/customViews/app_dialogs.dart';
import 'package:lunch_portal/utilities/utils/basic_function.dart';
import 'package:lunch_portal/utilities/utils/constants.dart';

import '../../lunch_portal.dart';
import '../../view/admin/dashboard/admin_dashboard_screen.dart';
import '../../view/authentication/complete_profile/complete_profile_screen.dart';
import '../../view/user/dashboard/dashboard_screen.dart';

class LoginHelper {
  Future<int> loginAndDecide({required bool isGoogle, String email = '', String password = ''}) async {
    if (isGoogle) {
      await LunchPortal.authViewModel.signInWithGoogle();
    } else {
      var credentials = await LunchPortal.authViewModel.signInWithEMailAndPassword(email, password);
      if (credentials == null) {
        return -1;
      }
    }

    if (await checkIfAdmin()) {
      LunchPortal.adminViewModel.setUserAsAdmin(true);
      return AppConstants.isAdmin;
    } else {
      LunchPortal.adminViewModel.setUserAsAdmin(false);
      if (await checkIfUserExist()) {
        return AppConstants.isUserExist;
      } else {
        return AppConstants.isUserNotExist;
      }
    }
  }

  Future<bool> checkIfAdmin() async {
    return await LunchPortal.adminViewModel.getAdminListAndCheck(LunchPortal.authViewModel.getUserEmail()!);
  }

  Future<bool> checkIfUserExist() async {
    return await LunchPortal.userViewModel.isUserAlreadyExist(LunchPortal.authViewModel.getUserEmail()!);
  }

  onClickLogin({required bool isGoogle, String email = '', String password = '', required BuildContext context}) async {
    showHideDialog(context, true);
    int result = await LunchPortal.loginHelper.loginAndDecide(isGoogle: isGoogle, email: email, password: password);
    switch (result) {
      case AppConstants.isAdmin:
        {
          showHideDialog(context, false);
          Navigator.pushNamed(context, AdminDashboardScreen.routeName);
          break;
        }
      case AppConstants.isUserExist:
        {
          showHideDialog(context, false);
          Navigator.pushNamed(context, CompleteProfile.routeName);
          break;
        }
      case AppConstants.isUserNotExist:
        {
          showHideDialog(context, false);
          Navigator.pushNamed(context, DashboardScreen.routeName);

          break;
        }
      case AppConstants.wrongCredentials:
        {
          showHideDialog(context, false);
          showToast(context, AppAlerts.invalidCredentials);
          break;
        }
    }
  }
}
