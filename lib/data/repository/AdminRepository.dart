import 'package:lunch_portal/lunch_portal.dart';

import '../../utilities/helperClasses/SharedPreferenceHelper.dart';

class AdminRepository {

  Future<bool> isUserAdmin() async {
    return await SharedPreferenceHelper.isUserAdmin();
  }

  setUserAsAdmin(bool isUserAdmin) async {
    await SharedPreferenceHelper.setUserAsAdmin(isUserAdmin);
  }

  Future<bool> isCategoryDeleted(String categoryId) async {
    return await LunchPortal.fireStoreHelper.isDeletedSuccessfully(categoryId);
  }

  Future<bool> getAdminListAndCheck(String email) async {
    return await LunchPortal.fireStoreHelper.getAdminListAndCheck(email);
  }
}
