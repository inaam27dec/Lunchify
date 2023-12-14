import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class SharedPreferenceHelper {

  static setUserAsAdmin(bool isAdmin) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(SharedPreferenceConstants.isUserAdmin, isAdmin);
  }

  static Future<bool> isUserAdmin() async {
    final preferences = await SharedPreferences.getInstance();
    final bool flag = (await preferences.get(SharedPreferenceConstants.isUserAdmin)) as bool? ??false ;
    return flag;
  }
}
