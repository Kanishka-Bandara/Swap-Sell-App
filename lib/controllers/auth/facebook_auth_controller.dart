import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:swap_sell/controllers/auth/auth_controller.dart';
import 'package:swap_sell/controllers/user/user_controller.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/email.dart';
import 'dart:convert' as JSON;

import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';

class FaceBookAuthController {
  static FaceBookAuthController defaultController = FaceBookAuthController();
  final FacebookLogin facebookLogin = FacebookLogin();

  Future<bool> loginWithFB(BuildContext context, AuthType authType) async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        Map profile = JSON.jsonDecode(graphResponse.body);
        String name = profile["name"];
        String imgUrl = profile["picture"]["data"]["url"];
        String email = profile["email"];
        String fbId = profile["id"];
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
                status: 1)
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
        } else {
          return await AuthController.defaultController
              .signInWithFb(au, context);
        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
    return false;
  }

  logout() async {
    facebookLogin.logOut();
  }
}
