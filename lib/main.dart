import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'lunch_portal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //Could be used after Adding flutterfire cli

  runApp(const LunchPortal());
}
