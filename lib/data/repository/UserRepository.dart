import 'package:lunch_portal/lunch_portal.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';

import '../model/CategoryDataModel.dart';
import '../model/FoodItemDataModel.dart';
import '../model/UserDataModel.dart';

class UserRepository {
  Future<void> insertUser(UserDataModel user) async {
    return await LunchPortal.fireStoreHelper.insertUser(user);
  }

  Future<UserDataModel?> getUserData() async {
    return await LunchPortal.fireStoreHelper.getUserData();
  }

  Future<List<Object>> getFloorsAndTeams() async {
    return await LunchPortal.fireStoreHelper.getFloorsAndTeams();
  }

  Future<List<CategoryDataModel>> getCategoriesList() async {
    return await LunchPortal.fireStoreHelper.getCategoriesList();
  }

  Future<List<FoodItemDataModel>> getCategoryItems(String categoryId) async {
    return await LunchPortal.fireStoreHelper.getCategoryItems(categoryId);
  }

  Future<bool> placeOrder(UserOrderDataModel order) async {
    return await LunchPortal.fireStoreHelper.placeOrder(order);
  }

  Future<bool> isUserAlreadyExist(String email) async {
    return await LunchPortal.fireStoreHelper.searchUserInFirestore(email);
  }
}
