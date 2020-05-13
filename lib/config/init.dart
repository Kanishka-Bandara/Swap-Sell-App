import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/user/user_controller.dart';
import 'package:swap_sell/model/shop/shop.dart';
import 'package:swap_sell/model/user/address.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';

class AppInit extends Model {
  static AppInit currentApp = AppInit();
  User _currentUser = User(
    id: 1,
    userId: "u0001",
    userType: UserType.SELLER_AND_BUYER,
    title: "Mr.",
    gender: "Male",
    fName: "Kanishka",
    lName: "Bandara",
    fullName: "Kanishka Udayakantha Bandara",
    emails: <Email>[
      Email(
        emailID: 1,
        emailType: EmailType.OFFICIAL,
        isDefault: true,
        email: "wmkubandara@gmail.com",
        status: 1,
        emailTypeId: EmailType.OFFICIAL.index,
        userId: 1,
      )
    ],
    country: "Sri Lanka",
    activeState: 1,
    note: "Good",
    profilePicUrl:
        "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5d2388f14c687b00085c0f91%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D0%26cropX2%3D1559%26cropY1%3D130%26cropY2%3D1690",
    status: 1,
    username: "kanishka12345",
    password: "123",
    addresses: [
      Address(
          id: 1,
          type: AddressType.BILLING,
          name: "Kanishka Bandara",
          poCode: "192/2",
          poArea: "Handapanagala",
          userId: 1,
          street: "Handapanagala",
          city: "Wellawaya",
          district: "Moneragala",
          province: "Uva",
          country: "Sri Lanka",
          isDefaultAddress: true,
          state: 1)
    ],
  );
  Shop _currentUserShop = Shop.exampleShop;

  bool get currentUserState {
    return AppInit.currentApp._currentUser == null ? false : true;
  }

  User get getCurrentUser => this._currentUser;

  set setCurrentUser(User user) {
    AppInit.currentApp._currentUser = user;
    notifyListeners();
  }

  void _removeCurruntUser() {
    AppInit.currentApp._currentUser = null;
    notifyListeners();
  }

  Future<User> editCurrentUser(User u) async {
    _currentUser =
        await UserController.defaultUserController.editUser(u, u.getId);
    notifyListeners();
    return _currentUser;
  }

  Future<User> editCurruntUserImage(File image) async {
    _currentUser = await UserController.defaultUserController
        .editUserImage(image, _currentUser);
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
    notifyListeners();
  }
}
