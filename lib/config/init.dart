import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/cart_Controller.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';

class AppInit extends Model {
  static AppInit currentApp = AppInit();
  User _currentUser = User(
    id: 1,
    userId: "u0001",
    title: "Mr.",
    gender: "Male",
    fName: "Kanishka",
    lName: "Bandara",
    fullName: "Kanishka Udayakantha Bandara",
    emails: <Email>[
      Email(
        emailID: 1,
        emailType: "Primary",
        email: "wmkubandara@gmail.com",
        status: 1,
      )
    ],
    country: "Sri Lanka",
    activeState: 1,
    status: 1,
  );
  CartController _userCart;

  bool get currentUserState {
    return AppInit.currentApp._currentUser == null ? false : true;
  }

  set setCurrentUser(User user) {
    AppInit.currentApp._currentUser = user;
    notifyListeners();
  }

  void _removeCurruntUser() {
    AppInit.currentApp._currentUser = null;
    notifyListeners();
  }

  void logOut() {
    AppInit.currentApp._removeCurruntUser();
    notifyListeners();
  }
}
