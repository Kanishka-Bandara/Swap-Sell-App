import 'package:swap_sell/api_manager/auth_api_manager.dart';

class AuthController {
  static AuthController defaultController = new AuthController();

  Future<bool> isUserNameAlreadyExist(String userName) async {
    return await AuthManagerAPI.defaultManager.isUserNameAlreadyExist(userName);
  }

  Future<bool> isEmailAlreadyExist(String email) async {
    return await AuthManagerAPI.defaultManager.isEmailAlreadyExist(email);
  }
}

enum AuthType {
  SIGNUP,
  SIGNIN,
}