import 'package:flutter/material.dart';
import '../../../../../../utilities/utils/colors.dart';
import '../../../../../../utilities/utils/constants.dart';
import '../../../utilities/utils/menu_items.dart';
import '../../../utilities/utils/routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const routeName = "UserDashboard_Screen";

  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {

  int selectedIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged:(index) => setState(
              () {
                selectedIndex = index;
                controller.jumpToPage(selectedIndex);
              },
            ),
        children: userBottomNavigationRoutes,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: userBottomNavigationItems,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: (index) => setState(
              () {
                selectedIndex = index;
                controller.jumpToPage(selectedIndex);
              },
            ),
      ),
    );
  }
}
