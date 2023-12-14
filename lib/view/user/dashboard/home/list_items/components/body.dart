import 'package:flutter/material.dart';
import 'package:lunch_portal/lunch_portal.dart';
import '../../../../../../data/model/CategoryDataModel.dart';
import '../../../../../../data/model/FoodItemDataModel.dart';
import '../../../../../../utilities/customViews/cart_item_tile.dart';
import '../../../../../../utilities/utils/colors.dart';
import '../../../../../../utilities/utils/constants.dart';
import '../../../../../../data/model/UserOrderDataModel.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.category}) : super(key: key);
  final CategoryDataModel category;

  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  late Future<List<FoodItemDataModel>> fetchedFoodItemsList;
  @override
  void initState() {
    print(widget.category.id);
    fetchedFoodItemsList =
        LunchPortal.userViewModel.getListItemsFromFireStore(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: fetchedFoodItemsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FoodItemDataModel> foodItemsList = snapshot.data as List<FoodItemDataModel>;
            return Container(
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
                              Text(
                                widget.category.name,
                                style: const TextStyle(
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
                        color: AppColors.whiteColor,
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
                              itemCount: foodItemsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: CartItem(
                                    foodItem: foodItemsList[index],
                                    isCart: false,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
