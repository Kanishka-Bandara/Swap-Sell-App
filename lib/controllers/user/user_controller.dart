import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/user/user.dart';

class UserController extends Model {
  static UserController defaultUserController = UserController();

  Future<User> createUser(User user) async {
    //TODO:Save User on backend
    return user;
  }

  Future<User> editUser(User user, int userID) async {
    print(user.toJson());
    //TODO:Edit User on backend
    return user;
  }

  Future<bool> deleteUser(int userID) async {
    //TODO:Edit User on backend
    return true;
  }

  Future<User> getUser(int userID) async {
    // TODO:get User on backend
    return null;
  }

  Future<User> editUserImage(File f, User user) async {
    //TODO:Send to the backend
    user.setProfilePicUrl =
        "https://ubistatic19-a.akamaihd.net/ubicomstatic/en-us/global/game-info/naked_boxshot_mobile_138233.jpg";
    return user;
  }
}
