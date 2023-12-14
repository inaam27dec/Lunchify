import 'package:flutter/material.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';
import 'package:lunch_portal/data/repository/UserRepository.dart';

import '../data/model/CategoryDataModel.dart';
import '../data/model/FoodItemDataModel.dart';
import '../data/model/UserDataModel.dart';

class UserViewModel {
  late UserRepository repository;

  UserViewModel(this.repository);

  Future<bool> isUserAlreadyExist(String email) async {
    return await repository.isUserAlreadyExist(email);
  }

  ///this function uploads the user in firebase firestore
  Future<void> insertUser(UserDataModel user) async {
    return repository.insertUser(user);
  }

  ///this function fetches teh data of the logged in user from firestore
  Future<UserDataModel?> getUserData() async {
    return await repository.getUserData();
  }

  ///this function fetches the floors and teams of the office
  Future<List<Object>> getFloorsAndTeams() async {
    return await repository.getFloorsAndTeams();
  }

  ///function to get food categories form firestore
  Future<List<CategoryDataModel>> getCategoriesFromFireStore() async {
    return await repository.getCategoriesList();
  }

  ///function to get food items form firestore
  Future<List<FoodItemDataModel>> getListItemsFromFireStore(
      String categoryId) async {
    return await repository.getCategoryItems(categoryId);
  }

  ///function is used to place the order
  Future<bool> placeOrder(UserOrderDataModel order) async {
    return await repository.placeOrder(order);
  }
}
