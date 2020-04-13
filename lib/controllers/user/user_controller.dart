import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/user/user.dart';

class UserController extends Model {
  static UserController defaultUserController = UserController();

  Future<User> createUser(User user) async {
    //Save User on backend
    return user;
  }

  Future<User> editUser(User user, int userID) async {
    //Edit User on backend
    return user;
  }

  Future<bool> deleteUser(int userID) async {
    //Edit User on backend
    return true;
  }
} 