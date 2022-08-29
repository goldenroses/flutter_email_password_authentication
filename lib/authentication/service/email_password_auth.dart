import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailPasswordAuth {
  Future<void> registerUserWithEmailAndPassword(String email_, String password_,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email_, password: password_);
      showSnackBar(context, 'Successfuly registered. Please login.');
      Navigator.popAndPushNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'Weak password, try set a stronger password');
      }
      if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'Email already registered');
      }
      else {
        // Note: It's note recommended to use print statements in a prod environment.
        print("Error: $e");
        showSnackBar(context, 'Something happened and we could not log you in');
      }
    }
  }

  Future<void> loginWithEmailAndPassword(BuildContext context,
      String email,
      String password) async {
    try {
      // Sign in the user on firebase with provided username and password
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final currentUserObject = FirebaseAuth.instance.currentUser;

      if (currentUserObject?.uid != null) {
        showSnackBar(context, 'Logging you in...');
        Navigator.popAndPushNamed(context, '/dashboard');

      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'The user with that email does not exist!');
      }
      if (e.code == 'invalid-email') {
        showSnackBar(context, 'Invalid email address, Please check again');
      } else {
        showSnackBar(context, 'Something happened and we could not log you in');
      }
    }
  }

}
// This is a snackbar that will display error messages to the user on the app.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, message) {
  return ScaffoldMessenger.of(
      context)
      .showSnackBar(
      SnackBar(
        content: Text(message),
      ));
}

