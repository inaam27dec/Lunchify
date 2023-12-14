import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunch_portal/data/repository/AuthRepository.dart';

class AuthViewModel {
  late AuthRepository repository;

  AuthViewModel(this.repository);

  String? getUserId() {
    return repository.getUserId();
  }

  String? getUserEmail() {
    return repository.getUserEmail();
  }

  Future<void> logoutUser() async {
    return repository.logoutUser();
  }

  Future<UserCredential> signInWithGoogle() async {
    return repository.signInWithGoogle();
  }

  Future<UserCredential?> signInWithEMailAndPassword(
      String email, String password) async {
    return repository.signInWithEMailAndPassword(email, password);
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    return repository.signUpWithEmailAndPassword(email, password);
  }
}
