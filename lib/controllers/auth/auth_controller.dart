import 'package:swap_sell/api_manager/auth_api_manager.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/user.dart';

class AuthController {
  static AuthController defaultController = new AuthController();
  void signUp(User u,AuthenticatedUser authenticatedUser) {
      AuthManagerAPI.defaultManager.signUp(u,authenticatedUser);
  }
  
  Future<bool> isUserNameAlreadyExist(String userName) async {
    return await AuthManagerAPI.defaultManager.isUserNameAlreadyExist(userName);
  }

  Future<bool> isEmailAlreadyExist(String email) async {
    return await AuthManagerAPI.defaultManager.isEmailAlreadyExist(email);
  }
}
