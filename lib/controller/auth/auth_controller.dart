import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swap_sell/api_manager/auth_api_manager.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/config/shared_pref.dart';
import 'package:swap_sell/controller/shop_controller.dart';
import 'package:swap_sell/controller/user/user_controller.dart';
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

  Future<void> signupUser(
      User u, AuthenticatedUser authenticatedUser, BuildContext context) async {
    User newUser = await UserController.defaultUserController.createUser(u);
    authenticatedUser.setUserId = newUser.getId;
    newUser = await AuthManagerAPI.defaultManager.signUp(authenticatedUser);
    if (newUser != null) {
      setLoggedInUserDetails(newUser, context);
    }
  }

  Future<bool> signInWithFb(AuthenticatedUser au, BuildContext context) async {
    User user = await AuthManagerAPI.defaultManager.signInWithFb(au);
    if (user != null) {
      return await setLoggedInUserDetails(user, context);
    } else {
      return false;
    }
  }

  Future<bool> signInWithGoogle(
      AuthenticatedUser au, BuildContext context) async {
    User user = await AuthManagerAPI.defaultManager.signInWithGoogle(au);
    if (user != null) {
      return await setLoggedInUserDetails(user, context);
    } else {
      return false;
    }
  }

  Future<bool> signInWithNormal(
      AuthenticatedUser au, BuildContext context) async {
    User user = await AuthManagerAPI.defaultManager.signInWithNormal(au);
    if (user != null) {
      return await setLoggedInUserDetails(user, context);
    } else {
      return false;
    }
  }

  Future<bool> setLoggedInUserDetails(User user, BuildContext context) async {
    bool status = false;
    status = await saveUserSharedPreferences(
      user.getId,
      user.getUserId,
      user.getUserType.toString(),
      user.getUsername,
      true,
    );
    AppInit.currentApp.setCurrentShop =
        await ShopController.defaultController.getShopByUserId(user.getId);
    AppInit.currentApp.setCurrentUser = user;
    if (context != null) {
      AppNavigator.navigateToHomePage(context);
    }
    return status;
  }

  getAndsetLoggedInUserDetails() async {
    if (!AppInit.currentApp.currentUserState) {
      User u = await UserController.defaultUserController
          .getUser(await this.getLoggedInUserId());
      await setLoggedInUserDetails(u, null);
    }
  }

  // BEGIN::CRUD on Shared Preferences
  Future<bool> saveUserSharedPreferences(
    int userDbId,
    String userDisplayId,
    String userType,
    String userName,
    bool isLoggedIn,
  ) async {
    bool status = false;
    status = await SPHelper.defaultHelper.save(
      SPKey.USER_DB_ID,
      userDbId,
    );
    status = await SPHelper.defaultHelper.save(
      SPKey.USER_DISPLAY_ID,
      userDisplayId,
    );
    status = await SPHelper.defaultHelper.save(
      SPKey.USER_TYPE,
      userType,
    );
    status = await SPHelper.defaultHelper.save(
      SPKey.USERNAME,
      userName,
    );
    status = await SPHelper.defaultHelper.save(
      SPKey.IS_LOGGED_IN,
      isLoggedIn,
    );
    return status;
  }

  Future<bool> isSomeOneLoggedIn() async {
    return await SPHelper.defaultHelper.get(SPKey.IS_LOGGED_IN);
  }

  Future<int> getLoggedInUserId() async {
    return await SPHelper.defaultHelper.getInt(SPKey.USER_DB_ID);
  }

  Future<String> getLoggedInUserName() async {
    return await SPHelper.defaultHelper.getString(SPKey.USERNAME);
  }

  Future<String> getLoggedInUserType() async {
    return await SPHelper.defaultHelper.getString(SPKey.USER_TYPE);
  }
  // END::CRUD on Shared Preferences
}

enum AuthType {
  SIGNUP,
  SIGNIN,
}
