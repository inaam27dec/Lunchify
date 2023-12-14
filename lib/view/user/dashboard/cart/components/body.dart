import 'package:flutter/material.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';
import '../../../../../data/model/FoodItemDataModel.dart';
import '../../../../../utilities/customViews/app_dialogs.dart';
import '../../../../../utilities/customViews/app_buttons.dart';
import '../../../../../utilities/customViews/cart_item_tile.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.signupBackgroundGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 21,
                      left: 11,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text(
                          'Cart Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppConstants.normalHeadingTextSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppConstants.borderRadius,
                    ),
                    topRight: Radius.circular(
                      AppConstants.borderRadius,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                            ),
                            child: Dismissible(
                              key: Key(index.toString()),
                              direction: DismissDirection.startToEnd,
                              background: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.errorColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 30),
                                child: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.white,
                                  size: AppConstants.iconSize,
                                ),
                              ),
                              confirmDismiss: (direction) async {
                                return await showDeleteItemAlertDialog(context);
                              },
                              onDismissed: (direction) {},
                              child: CartItem(
                                foodItem: FoodItemDataModel(
                                    id: 'id',
                                    name: 'name',
                                    imageUrl: 'imageUrl',
                                    price: 3434),
                                isCart: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(
                      color: AppColors.hintColor,
                      height: 5,
                    ),
                    Expanded(
                      flex: 3,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Total Items: 3',
                                  style: TextStyle(
                                    color: AppColors.hintColor,
                                  ),
                                ),
                                Text(
                                  'Rs. 270',
                                  style: TextStyle(
                                    fontSize: AppConstants.buttonTextSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            submitWideButton(
                              onPressed: () {},
                              text: 'Checkout',
                              buttonSize: AppConstants.buttonWideSize,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
