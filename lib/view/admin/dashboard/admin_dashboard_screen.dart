import 'package:flutter/material.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';
import '../../../utilities/utils/constants.dart';
import '../../../utilities/utils/menu_items.dart';
import '../../../utilities/utils/routes.dart';


class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  static const routeName = RouteConstants.adminDashboardRoute;

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adminBottomNavigationRoutes.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: adminBottomNavigationItems,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
      ),
    );
  }
}
