import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunch_portal/lunch_portal.dart';
import 'package:lunch_portal/data/repository/UserRepository.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';

import '../data/repository/AdminRepository.dart';

class AdminViewModel {
  late AdminRepository repository;

  AdminViewModel(this.repository);

  Future<bool> isUserAdmin() async {
    return await repository.isUserAdmin();
  }

  setUserAsAdmin(bool isUserAdmin) async {
    return await repository.setUserAsAdmin(isUserAdmin);
  }

  Future<bool> isCategoryDeleted(String categoryId) async {
    return repository.isCategoryDeleted(categoryId);
  }

  Future<bool> getAdminListAndCheck(String email) async {
    return await repository.getAdminListAndCheck(email);
  }
}
