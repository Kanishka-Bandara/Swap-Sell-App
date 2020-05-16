import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swap_sell/api_manager/auth_api_manager.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/ui/components/default_components.dart';

class AuthController {
  static AuthController defaultController = new AuthController();

  Future<bool> isUserNameAlreadyExist(String userName) async {
    return await AuthManagerAPI.defaultManager.isUserNameAlreadyExist(userName);
  }

  Future<bool> isEmailAlreadyExist(String email) async {
    return await AuthManagerAPI.defaultManager.isEmailAlreadyExist(email);
  }

  Future<bool>  signInWithFb(AuthenticatedUser au, BuildContext context) async {
    User user = await AuthManagerAPI.defaultManager.signInWithFb(au);
    if (user != null) {
      AppInit.currentApp.setCurrentUser = user;
      AppNavigator.navigateToHomePage(context);
      return true;
    } else {
      return false;
    }
  }

  Future<bool>  signInWithGoogle(AuthenticatedUser au, BuildContext context) async {
    User user = await AuthManagerAPI.defaultManager.signInWithGoogle(au);
    if (user != null) {
      AppInit.currentApp.setCurrentUser = user;
      AppNavigator.navigateToHomePage(context);
      return true;
    } else {
      return false;
    }
  }
}

enum AuthType {
  SIGNUP,
  SIGNIN,
}
