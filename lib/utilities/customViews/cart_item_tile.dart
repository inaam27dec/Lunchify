import 'package:flutter/material.dart';

import '../../data/model/FoodItemDataModel.dart';
import '../../data/model/UserOrderDataModel.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.foodItem, required this.isCart})
      : super(key: key);
  final FoodItemDataModel foodItem;
  final bool isCart;
  @override
  State<StatefulWidget> createState() => _CartItem();
}

class _CartItem extends State<CartItem> {
  // data Items will be fetched online
  int itemCount = 0;
  late double itemPrice;

  @override
  void initState() {
    itemPrice = widget.foodItem.price;
    super.initState();
  }

  double sumPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cartItemBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 9,
          bottom: 11,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  child: Image.network(
                    widget.foodItem.imageUrl,
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Text(
                        widget.foodItem.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.buttonTextSize,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                      height: 2,
                    ),
                    widget.isCart
                        ? Text(
                            'Rs. $sumPrice',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.buttonTextSize,
                              color: AppColors.primary,
                            ),
                          )
                        : Text(
                            'Rs. ${widget.foodItem.price.round()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.buttonTextSize,
                              color: AppColors.textColor,
                            ),
                          ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${itemCount.toString()}x',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.smallTextSize,
                    color: widget.isCart
                        ? AppColors.textColor
                        : AppColors.primary,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            itemCount++;
                            sumPrice = itemCount * itemPrice;
                          },
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              AppConstants.borderRadius,
                            ),
                            topRight: Radius.circular(
                              AppConstants.borderRadius,
                            ),
                          ),
                        ),
                        child: const SizedBox(
                          width: 25,
                          height: 32,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (itemCount > 0) {
                              itemCount--;
                              sumPrice = itemCount * itemPrice;
                            }
                          },
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.lightGrayColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              AppConstants.borderRadius,
                            ),
                            bottomRight: Radius.circular(
                              AppConstants.borderRadius,
                            ),
                          ),
                        ),
                        child: const SizedBox(
                          width: 25,
                          height: 32,
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: AppColors.textColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
