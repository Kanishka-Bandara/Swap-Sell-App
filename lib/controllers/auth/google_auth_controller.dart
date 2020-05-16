import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swap_sell/controllers/auth/auth_controller.dart';
import 'package:swap_sell/controllers/user/user_controller.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';

class GoogleAuthController {
  static GoogleAuthController defaultController = GoogleAuthController();

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  loginWithGoogle(BuildContext context, AuthType authType) async {
    try {
      await _googleSignIn.signIn();
      GoogleSignInAccount currentUser = _googleSignIn.currentUser;
      print(currentUser);
      String name = currentUser.displayName;
      String imgUrl = currentUser.photoUrl;
      String email = currentUser.email;
      String fbId = currentUser.id;
      User u = User(
        id: null,
        userId: fbId,
        userType: UserType.SELLER_AND_BUYER,
        title: "Mr.",
        gender: "Not Specified",
        fname: name,
        lname: name,
        fullName: name,
        activeState: 1,
        profilePicUrl: imgUrl,
        emails: [
          Email(
            id: null,
            emailTypeId: EmailType.AUTHENTICATION.index,
            emailType: EmailType.AUTHENTICATION,
            email: email,
            isDefault: 1,
            userId: null,
            status: 1,
          )
        ],
        country: "Sri Lanka",
        status: 1,
      );
      AuthenticatedUser au = AuthenticatedUser(
        logInAt: DateTime.now(),
        status: 1,
        facebookId: fbId,
      );
      if (authType == AuthType.SIGNUP) {
        UserController.defaultUserController.signupUser(u, au, context);
      } else {}
    } catch (err) {
      print(err);
    }
  }

  logOut() async {
    await _googleSignIn.signOut();
  }
}
