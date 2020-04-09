import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthController {
  static GoogleAuthController defaultController = GoogleAuthController();

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  loginWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      print(_googleSignIn.currentUser);
    } catch (err) {
      print(err);
    }
  }

  logOut() async {
    await _googleSignIn.signOut();
  }
}
