import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_portal/lunch_portal.dart';

class AuthRepository {
  String? getUserId() {
    return LunchPortal.firebaseAuthHelper.getUserId();
  }

  String? getUserEmail() {
    return LunchPortal.firebaseAuthHelper.getUserEmail();
  }

  Future<void> logoutUser() async {
    return LunchPortal.firebaseAuthHelper.logoutUser();
  }

  Future<UserCredential> signInWithGoogle() async {
    return LunchPortal.firebaseAuthHelper.signInWithGoogle();
  }

  Future<UserCredential?> signInWithEMailAndPassword(
      String email, String password) async {
    return LunchPortal.firebaseAuthHelper
        .signInWithEMailAndPassword(email, password);
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    return LunchPortal.firebaseAuthHelper
        .signUpWithEmailAndPassword(email, password);
  }
}
