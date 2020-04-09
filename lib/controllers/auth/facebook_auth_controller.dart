import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class FaceBookAuthController {
  static FaceBookAuthController defaulyController = FaceBookAuthController();
  final FacebookLogin facebookLogin = FacebookLogin();

  loginWithFB() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        Map profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("Cancelled");
        break;
      case FacebookLoginStatus.error:
        print("Error");
        break;
    }
  }
}
