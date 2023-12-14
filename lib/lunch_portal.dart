import 'package:flutter/material.dart';
import 'package:lunch_portal/data/repository/AdminRepository.dart';
import 'package:lunch_portal/data/repository/AuthRepository.dart';
import 'package:lunch_portal/data/repository/UserRepository.dart';
import 'package:lunch_portal/utilities/helperClasses/FireStoreHelper.dart';
import 'package:lunch_portal/utilities/helperClasses/FirebaseAuthHelper.dart';
import 'package:lunch_portal/utilities/helperClasses/LoginHelper.dart';
import 'package:lunch_portal/utilities/utils/routes.dart';
import 'package:lunch_portal/view/user/dashboard/dashboard_screen.dart';
import 'package:lunch_portal/viewModel/AdminViewModel.dart';
import 'package:lunch_portal/viewModel/AuthViewModel.dart';
import 'package:lunch_portal/viewModel/UserViewModel.dart';

import '../../../../../../utilities/utils/constants.dart';

class LunchPortal extends StatefulWidget {
  const LunchPortal({Key? key}) : super(key: key);

  static final firebaseAuthHelper = FirebaseAuthHelper();
  static final fireStoreHelper = FireStoreHelper();
  static final loginHelper = LoginHelper();
  static final userRepository = UserRepository();
  static final authRepository = AuthRepository();
  static final userViewModel = UserViewModel(userRepository);
  static final authViewModel = AuthViewModel(authRepository);
  static final _admin_repository = AdminRepository();
  static final adminViewModel = AdminViewModel(_admin_repository);

  @override
  State<LunchPortal> createState() => _LunchPortalState();
}

class _LunchPortalState extends State<LunchPortal> {
  late Future<bool> isAdmin;

  @override
  void initState() {
    isAdmin = LunchPortal.adminViewModel.isUserAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Will Fetch the data from Shared Preference to check if the user is Admin or not
    if (LunchPortal.firebaseAuthHelper.isUserLoggedIn()) {
      return FutureBuilder(
          future: isAdmin,
          builder: (context, adminResult) {
            if (adminResult.hasData) {
              /// It means that there is data in shared preference
              bool checkIfAdmin = adminResult.data as bool;
              if (checkIfAdmin) {
                ///show admin dashboard
                return showRespectiveScreens(RouteConstants.adminDashboardRoute);
              } else {
                /// show user dashboard
                return showRespectiveScreens(DashboardScreen.routeName);
              }
            }
            return showLoadingUntilData();
          });
    } else {
      ///show user login Screen
      return showRespectiveScreens(RouteConstants.loginRoute);
    }
  }

  showLoadingUntilData() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget showRespectiveScreens(String screenName) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: screenName,
        routes: routes);
  }
}
