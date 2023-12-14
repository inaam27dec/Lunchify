import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../data/model/CategoryDataModel.dart';
import '../../data/model/FoodItemDataModel.dart';
import '../../data/model/UserDataModel.dart';
import '../../data/model/UserOrderDataModel.dart';
import '/lunch_portal.dart';
import '../utils/constants.dart';

class FireStoreHelper {

  Future<void> insertUser(UserDataModel user) async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection(FirebaseConstants.userCollection);

    var uid = LunchPortal.authViewModel.getUserId();
    var email = LunchPortal.authViewModel.getUserEmail();

    if (uid != null) {
      user.id = uid;
      user.eMail = email!;

      Map<String, dynamic> userData = user.toJson();

      await usersRef.doc(user.id).set(userData);
    }
  }

  Future<void> updateUser(UserDataModel user) async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection(FirebaseConstants.userCollection);

    Map<String, dynamic> userData = user.toJson();
    await usersRef.doc(user.id).update(userData);
  }

  Future<UserDataModel?> getUserData() async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection(FirebaseConstants.userCollection);

    var uid = LunchPortal.authViewModel.getUserId();

    UserDataModel? user;
    await usersRef.doc(uid).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        user = UserDataModel.fromJson(data);
      },
    );

    return user;
  }

  Future<List<Object>> getFloorsAndTeams() async {
    List<Object> floorsAndTeamsList = [];

    floorsAndTeamsList.add(await fetchFloors());
    floorsAndTeamsList.add(await fetchTeams());

    return floorsAndTeamsList;
  }

  Future<List<String>> fetchTeams() async {
    final CollectionReference usersRef = FirebaseFirestore.instance
        .collection(FirebaseConstants.appDataCollection);

    List<String> teams = [];

    await usersRef.doc(FirebaseConstants.teamsDocument).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        data.forEach(
          (key, value) {
            teams.add(value);
          },
        );
      },
    );

    return teams;
  }

  Future<List<int>> fetchFloors() async {
    final CollectionReference usersRef = FirebaseFirestore.instance
        .collection(FirebaseConstants.appDataCollection);

    List<int> floors = [];

    await usersRef.doc(FirebaseConstants.floorsDocument).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        data.forEach(
          (key, value) {
            floors.add(value);
          },
        );
      },
    );

    return floors;
  }

  Future<List<CategoryDataModel>> getCategoriesList() async {
    print("get categories called");
    final CollectionReference categoryReference = FirebaseFirestore.instance
        .collection(FirebaseConstants.categoryCollection);

    List<CategoryDataModel> list = [];

    var data = await categoryReference
        .where(FirebaseConstants.isEnabled, isEqualTo: true)
        .get();
    list = List.from(data.docs.map((e) => CategoryDataModel.fromSnapshot(e, e.id)));
    print("categories fetched, list size=${list.length}");
    return list;
  }

  Future<List<FoodItemDataModel>> getCategoryItems(String categoryId) async {
    final Query<Map<String, dynamic>> foodItemsReference = FirebaseFirestore
        .instance
        .collectionGroup(FirebaseConstants.itemsCollection);
    // final CollectionReference foodItemsReference = FirebaseFirestore.instance
    //     .collection(FirebaseConstants.categoryCollection)
    //     .doc(categoryId)
    //     .collection(FirebaseConstants.itemsCollection);
    List<FoodItemDataModel> list = [];

    QuerySnapshot<Object?> querySnapshot = await foodItemsReference.get();

    print("Items fetched, list size=${querySnapshot.docs.length}");
/*
    querySnapshot.docs.map((foodItem) {

    print(foodItem[FoodItemConstants.name]);

      var item = FoodItem(
          id: foodItem.id,
          name: foodItem[FoodItemConstants.name],
          imageUrl: foodItem[FoodItemConstants.imageUrl],
          price: (foodItem[FoodItemConstants.price] as int).toDouble());

      list.add(item);
    });
*/

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var json = querySnapshot.docs.elementAt(i);
      var foodItemID = json.id;

      var item = FoodItemDataModel(
          id: foodItemID,
          name: querySnapshot.docs
              .elementAt(i)[FoodItemConstants.name]
              .toString(),
          imageUrl: querySnapshot.docs
              .elementAt(i)[FoodItemConstants.imageUrl]
              .toString(),
          price: (json[FoodItemConstants.price] as int).toDouble());

      list.add(item);
    }
    return list;
  }

  Future<bool> searchUserInFirestore(String email) async {
    print("search called");
    // await FirebaseFirestore.instance
    //     .collection(USER_COLLECTION)
    //     .where(EMAIL_OF_USER, isEqualTo: email)
    //     .get();
    var response = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollection)
        .where(FirebaseConstants.emailOfUser,
            isGreaterThanOrEqualTo: email,
            isLessThan: email.substring(0, email.length - 1) +
                String.fromCharCode(email.codeUnitAt(email.length - 1) + 1))
        .get();
    if (kDebugMode) {
      print("user search response size=${response.size}");
    }
    if (response.size == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isUserAdmin(String email) async {
    var response = await FirebaseFirestore.instance
        .collection(FirebaseConstants.adminCollection)
        .where(FirebaseConstants.emailOfAdmin,
            isGreaterThanOrEqualTo: email,
            isLessThan: email.substring(0, email.length - 1) +
                String.fromCharCode(email.codeUnitAt(email.length - 1) + 1))
        .get();
    if (response.size > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isDeletedSuccessfully(String categoryId) async {
    var map = <String, Object>{};
    map['isEnabled'] = false;
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.categoryCollection)
          .doc(categoryId)
          .update(map);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<bool> placeOrder(UserOrderDataModel order) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.orderCollection)
          .add(order.toJson());
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("error in store order in firestore=$e");
      }
      return false;
    }
  }

  Future<bool> getAdminListAndCheck(String email) async {
    var response = await FirebaseFirestore.instance
        .collection(FirebaseConstants.adminCollection)
        .where(FirebaseConstants.emailOfAdmin,
        isGreaterThanOrEqualTo: email,
        isLessThan: email.substring(0, email.length - 1) +
            String.fromCharCode(email.codeUnitAt(email.length - 1) + 1))
        .get();
    if (response.size > 0) {
      return true;
    } else {
      return false;
    }
  }

}