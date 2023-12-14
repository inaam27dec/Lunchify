import 'package:flutter/material.dart';

import '../../view/user/dashboard/dashboard_components/custom_widgets.dart';

List<BottomNavigationBarItem> adminBottomNavigationItems = [
  navigationItem(icon: Icons.category, label: "Categories"),
  navigationItem(icon: Icons.home, label: 'Home'),
  navigationItem(icon: Icons.receipt, label: 'Orders'),
  navigationItem(icon: Icons.person, label: 'Profile'),
];

List<BottomNavigationBarItem> userBottomNavigationItems = [
  navigationItem(icon: Icons.home, label: 'Home'),
  navigationItem(icon: Icons.receipt, label: 'Orders'),
  navigationItem(icon: Icons.person, label: 'Profile'),
];
