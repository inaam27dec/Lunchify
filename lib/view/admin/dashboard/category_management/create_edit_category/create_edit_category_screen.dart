import 'package:flutter/material.dart';

import 'body.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';

class CreateEditCategoryScreen extends StatelessWidget {
  const CreateEditCategoryScreen({Key? key}) : super(key: key);
  static const routeName = RouteConstants.createEditCategoryRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
