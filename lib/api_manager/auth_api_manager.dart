import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/user.dart';

class AuthManagerAPI {
  static AuthManagerAPI defaultManager = AuthManagerAPI();

  Future<bool> isUserNameAlreadyExist(String userName) async {
    var response = await http.post(
      URLHolder.USERNAME_ALREADY_EXISTS_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'username': userName,
        },
      ),
    );
    if (response.statusCode == 200) {
      return int.parse(response.body) == 1;
    }
    return null;
  }

  Future<bool> isEmailAlreadyExist(String email) async {
    var response = await http.post(
      URLHolder.EMAIL_ALREADY_EXISTS_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
        },
      ),
    );
    if (response.statusCode == 200) {
      return int.parse(response.body) == 1;
    } else {
      return null;
    }
  }

  Future<User> signUp(AuthenticatedUser u) async {
    var response = await http.post(
      URLHolder.SIGNUP_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(u),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<User> _signIn(AuthenticatedUser u, String url) async {
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(u),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<User> signInWithFb(AuthenticatedUser u) async {
    return _signIn(u, URLHolder.SIGNIN_FB_URL);
  }

  Future<User> signInWithGoogle(AuthenticatedUser u) async {
    return _signIn(u, URLHolder.SIGNIN_G_URL);
  }

  Future<User> signInWithNormal(AuthenticatedUser u) async {
    return _signIn(u, URLHolder.SIGNIN_NORMAL_URL);
  }
}
