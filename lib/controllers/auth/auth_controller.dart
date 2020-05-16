import 'package:flutter/cupertino.dart';
import 'package:swap_sell/api_manager/auth_api_manager.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/user.dart';

class AuthController {
  static AuthController defaultController = new AuthController();

  Future<bool> isUserNameAlreadyExist(String userName) async {
    return await AuthManagerAPI.defaultManager.isUserNameAlreadyExist(userName);
  }

  Future<bool> isEmailAlreadyExist(String email) async {
    return await AuthManagerAPI.defaultManager.isEmailAlreadyExist(email);
  }

Future<User> signInWithFb(AuthenticatedUser au,BuildContext context){
 return AuthManagerAPI.defaultManager.signInWithFb(au); 
}

Future<User> signInWithGoogle(AuthenticatedUser au,BuildContext context){
 return AuthManagerAPI.defaultManager.signInWithGoogle(au); 
}

}

enum AuthType {
  SIGNUP,
  SIGNIN,
}