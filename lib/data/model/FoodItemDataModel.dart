import '../../utilities/utils/constants.dart';

class FoodItemDataModel {
  FoodItemDataModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  String id;
  String name;
  String imageUrl;
  double price;
  int quantity = 0;

  FoodItemDataModel.fromJson(Map<String, Object?> json, String foodItemID)
      : id = foodItemID,
        name = json[FoodItemConstants.name]! as String,
        imageUrl = json[FoodItemConstants.imageUrl]! as String,
        price = json[FoodItemConstants.price]! as double;

  FoodItemDataModel.fromSnapshot(snapshot, foodItemID)
      : id = foodItemID,
        name = snapshot.data()[FoodItemConstants.name]! as String,
        imageUrl = snapshot.data()[FoodItemConstants.imageUrl]! as String,
        price = double.parse(snapshot.data()[FoodItemConstants.price]!);

  Map<String, Object?> toJson() {
    return {
      FoodItemConstants.id: id,
      FoodItemConstants.name: name,
      FoodItemConstants.imageUrl: imageUrl,
      FoodItemConstants.price: price,
    };
  }

  setQuantity(int quantity) {
    this.quantity = quantity;
  }
}
