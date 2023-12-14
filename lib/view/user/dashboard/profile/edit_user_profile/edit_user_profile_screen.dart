import 'package:flutter/material.dart';

import 'components/body.dart';

class EditUserProfile extends StatelessWidget {
  const EditUserProfile({Key? key}) : super(key: key);

  static const routeName = "EditUserProfile_Screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: const Scaffold(
          body: Body(),
        ),
      ),
    );
  }
}
