import 'package:flutter/material.dart';

import '../../../../../data/model/CategoryDataModel.dart';
import '../../../../../data/model/UserOrderDataModel.dart';
import 'components/body.dart';

class ListItemsScreen extends StatelessWidget {
  const ListItemsScreen({Key? key}) : super(key: key);

  static const routeName = "ListItems_Screen";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ListItemsScreenArguments;

    return Scaffold(
      body: Body(category: args.category),
    );
  }
}

// For Passing Data to this Widget
class ListItemsScreenArguments {
  final CategoryDataModel category;

  ListItemsScreenArguments(this.category);
}
