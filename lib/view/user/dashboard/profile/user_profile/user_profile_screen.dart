import 'package:flutter/material.dart';

import 'components/body.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  static const routeName = "UserProfile_Screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Body(),
    );
  }
}
