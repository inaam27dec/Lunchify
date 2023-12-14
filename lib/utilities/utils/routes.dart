import 'package:flutter/widgets.dart';
import 'package:lunch_portal/utilities/utils/constants.dart';
import 'package:lunch_portal/view/authentication/LoginScreen.dart';

import '../../view/admin/dashboard/admin_dashboard_screen.dart';
import '../../view/admin/dashboard/category_management/category_list/categories_list_screen.dart';
import '../../view/admin/dashboard/category_management/create_edit_category/create_edit_category_screen.dart';
import '../../view/authentication/complete_profile/complete_profile_screen.dart';
import '../../view/authentication/SignUpScreen.dart';
import '../../view/user/dashboard/cart/cart_screen.dart';
import '../../view/user/dashboard/dashboard_screen.dart';
import '../../view/user/dashboard/home/categories/categories.dart';
import '../../view/user/dashboard/home/list_items/list_screen.dart';
import '../../view/user/dashboard/home/orders/orders_screen.dart';
import '../../view/user/dashboard/profile/edit_user_profile/edit_user_profile_screen.dart';
import '../../view/user/dashboard/profile/user_profile/user_profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ///Authentication Routes
  RouteConstants.loginRoute: ((context) => const LoginScreen()),
  RouteConstants.signUpRoute: ((context) => const SignUpScreen()),


  CompleteProfile.routeName: ((context) => const CompleteProfile()),

  EditUserProfile.routeName: ((context) => const EditUserProfile()),
  DashboardScreen.routeName: ((context) => const DashboardScreen()),
  UserProfileScreen.routeName: (((context) => const UserProfileScreen())),
  CategoriesScreen.routeName: (((context) => const CategoriesScreen())),
  CartScreen.routeName: (((context) => const CartScreen())),
  ListItemsScreen.routeName: (((context) => const ListItemsScreen())),
  AdminDashboardScreen.routeName: (((context) => const AdminDashboardScreen())),
  CreateEditCategoryScreen.routeName: (((context) => const CreateEditCategoryScreen())),
  OrdersScreen.routeName: (((context) => const OrdersScreen())),
};

const List<Widget> adminBottomNavigationRoutes = <Widget>[
  CategoriesListScreen(),
  Center(child: Text('Index 1: Home')),
  Center(child: Text('Index 2: Orders')),
  Center(child: Text("index 3: prile screen"))
];

const List<Widget> userBottomNavigationRoutes = <Widget>[
  CategoriesScreen(),
  Center(child: Text('Index 1: Orders')),
  UserProfileScreen(),
];
