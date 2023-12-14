import '../../utilities/utils/constants.dart';
import 'FoodItemDataModel.dart';
import 'UserDataModel.dart';

class UserOrderDataModel {
  UserOrderDataModel({required this.user, required this.orderItems});

  late UserDataModel user;
  late List<FoodItemDataModel> orderItems;

  UserOrderDataModel.fromJson(Map<String, dynamic> json)
      : user = json[FirebaseConstants.orderUserCollection] as UserDataModel,
        orderItems = json[FirebaseConstants.orderFoodItemCollection]
            as List<FoodItemDataModel>;

  Map<String, Object?> toJson() {
    return {
      FirebaseConstants.orderUserCollection: user,
      FirebaseConstants.orderFoodItemCollection: orderItems
    };
  }
}
