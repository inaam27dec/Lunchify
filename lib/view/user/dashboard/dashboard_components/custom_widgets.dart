import 'package:flutter/material.dart';

BottomNavigationBarItem navigationItem({required icon, required label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
