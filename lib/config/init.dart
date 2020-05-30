import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/auth/auth_controller.dart';
import 'package:swap_sell/controllers/message_controlller.dart';
import 'package:swap_sell/controllers/notification_controller.dart';
import 'package:swap_sell/controllers/user/user_controller.dart';
import 'package:swap_sell/model/shop/shop.dart';
import 'package:swap_sell/model/user/user.dart';

class AppInit extends Model {
  static AppInit currentApp = AppInit();
  User _currentUser;

  Shop _currentUserShop = Shop.exampleShop;

  bool getIsSomeOneAlreadyLoggedIn() {
    AuthController.defaultController.isSomeOneLoggedIn().then((value) {
      AuthController.defaultController.getAndsetLoggedInUserDetails();
      return value;
    });
    return false;
  }

  bool get currentUserState {
    return AppInit.currentApp._currentUser == null ? false : true;
  }

  User get getCurrentUser => this._currentUser;

  set setCurrentUser(User user) {
    AppInit.currentApp._currentUser = user;
    notifyListeners();
    loadUserDetailsOnApp();
  }

  void _removeCurruntUser() {
    AppInit.currentApp._currentUser = null;
    notifyListeners();
  }

  Future<bool> editCurrentUser(User u) async {
    _currentUser =
        await UserController.defaultUserController.editUser(u, u.getId);
    notifyListeners();
    return true;
  }

  Future<User> editCurruntUserImage(File image) async {
    _currentUser = await UserController.defaultUserController
        .editUserImage(image, _currentUser);
    print(_currentUser.getProfilePicUrl);
    notifyListeners();
    return _currentUser;
  }

  bool get currentShopState {
    return AppInit.currentApp._currentUserShop == null ? false : true;
  }

  set setCurrentShop(Shop shop) {
    AppInit.currentApp._currentUserShop = shop;
    notifyListeners();
  }

  void _removeCurruntShop() {
    AppInit.currentApp._currentUserShop = null;
    notifyListeners();
  }

  void logOut() {
    AppInit.currentApp._removeCurruntUser();
    AppInit.currentApp._removeCurruntShop();
    AuthController.defaultController.saveUserSharedPreferences(-1, null, null, null, false);
    notifyListeners();
  }

  void loadUserDetailsOnApp() {
    NotificationController.currentController.fetchNotificationList();
    MessageController.defaultMessageController.fetchMessageList();
  }
}
