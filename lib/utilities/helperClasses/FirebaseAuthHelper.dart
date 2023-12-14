import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthHelper {
  final FirebaseAuth instance = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  ///Function to check if the user is logged in or not
  bool isUserLoggedIn() {
    return instance.currentUser != null;
  }

  ///Function is used to get the current user logged in ID
  ///If the user is not logged in, it will return Null
  String? getUserId() {
    return instance.currentUser?.uid;
  }

  ///Function is used to get the Email of the user
  ///It will return null if no email found
  String? getUserEmail() {
    return instance.currentUser?.email;
  }

  ///Function is used to send the verification email to the respective email
  Future<void>? sendVerificationEmail() {
    return instance.currentUser?.sendEmailVerification();
  }

  ///Function is used to check if the email is verified
  bool? isEmailVerified() {
    return instance.currentUser?.emailVerified;
  }

  ///Function is used to logout the user.
  Future<void> logoutUser() async {
    instance.signOut();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
  }

  ///Function is used to sign In user with Phone Number
  Future<ConfirmationResult> signInWithPhone({required String phoneNumber}) async {
    return await instance.signInWithPhoneNumber(phoneNumber);
  }

  ///Function is used to signInWithGoogle Using Firebase
  /// Trigger the authentication flow
  /// Obtain the auth details from the request
  /// Create a new credential
  /// Once signed in, return the UserCredential
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = await GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print(googleUser!.email);
    print(googleUser.id);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///Function is used to sign in using Email and password
  ///if success it will return some credentials
  ///Or we can see check on Null
  Future<UserCredential?> signInWithEMailAndPassword(String email, String password) async {
    try {
      final credential = await instance.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      return null;
    }
  }

  ///Function is used to sign up using Email and password
  ///if success it will return some credentials
  ///Or we can see check on Null
  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await instance.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
