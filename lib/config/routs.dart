import 'package:flutter/material.dart';
import 'package:swap_sell/ui/pages/chat_view.dart';
import 'package:swap_sell/ui/pages/checkout.dart';
import 'package:swap_sell/ui/pages/created_product_view.dart';
import 'package:swap_sell/ui/pages/message_list_view.dart';
import 'package:swap_sell/ui/pages/notification_view.dart';
import 'package:swap_sell/ui/pages/preparation_for_checkout.dart';
import 'package:swap_sell/ui/pages/product_management/product_management.dart';
import 'package:swap_sell/ui/pages/product_view.dart';
import 'package:swap_sell/ui/pages/home.dart';
import 'package:swap_sell/ui/pages/profile_view.dart';
import 'package:swap_sell/ui/pages/saved_view.dart';
import 'package:swap_sell/ui/pages/settings/addresses_view.dart';
import 'package:swap_sell/ui/pages/settings/settings.dart';
import 'package:swap_sell/ui/pages/shopping_cart.dart';
import 'package:swap_sell/ui/pages/signin.dart';
import 'package:swap_sell/ui/pages/signup.dart';
import 'package:swap_sell/ui/pages/speech_recognizer.dart';
import 'package:swap_sell/ui/pages/wish_list_view.dart';

class Routes {
  static const String ROUTES_HOME = '/';
  static const String ROUTES_SIGNIN = '/signin';
  static const String ROUTES_SIGNUP = '/signUp';
  static const String ROUTES_PROFILE_VIEW = '/profileView';
  static const String ROUTES_PRODUCT_VIEW = '/productView';
  static const String ROUTES_PRODUCT_DUMMY_VIEW = '/productDummyView';
  static const String ROUTES_PRODUCT_MANAGEMENT = '/productManagement';
  static const String ROUTES_SHOPPING_CART = '/shoppingCart';
  static const String ROUTES_NOTIFICATION_VIEW = '/notificationView';
  static const String ROUTES_MESSAGE_LIST_VIEW = '/messageListView';
  static const String ROUTES_CHAT_VIEW = '/chatView';
  static const String ROUTES_SAVED_VIEW = '/savedView';
  static const String ROUTES_WISH_LIST_VIEW = '/wishListView';
  static const String ROUTES_SETTINGS_VIEW = '/settings';
  static const String ROUTES_SETTINGS_ADDRESSES_VIEW = '/settings_address_view';
  static const String ROUTES_CHECKOUT_VIEW = '/checkOut';
  static const String ROUTES_PREPARATION_VIEW = '/preparation';
  static const String ROUTES_VOICE_RECOGNIZER = '/voice';

  static final Map<String, WidgetBuilder> routes = {
    ROUTES_HOME: (BuildContext context) => Home(),
    ROUTES_SIGNIN: (BuildContext context) => Signin(),
    ROUTES_SIGNUP: (BuildContext context) => Signup(),
    ROUTES_PRODUCT_VIEW: (BuildContext context) => ProductView(),
    ROUTES_PROFILE_VIEW: (BuildContext context) => UserProfileView(),
    ROUTES_PRODUCT_DUMMY_VIEW: (BuildContext context) => CreatedProductView(),
    ROUTES_PRODUCT_MANAGEMENT: (BuildContext context) => ProductManagement(),
    ROUTES_NOTIFICATION_VIEW: (BuildContext context) => NotificationView(),
    ROUTES_MESSAGE_LIST_VIEW: (BuildContext context) => MessageView(),
    ROUTES_CHAT_VIEW: (BuildContext context) => ChatView(),
    ROUTES_SAVED_VIEW: (BuildContext context) => SavedView(),
    ROUTES_SHOPPING_CART: (BuildContext context) => ShoppingCart(),
    ROUTES_SETTINGS_VIEW: (BuildContext context) => Settings(),
    ROUTES_SETTINGS_ADDRESSES_VIEW: (BuildContext context) => AddressesView(),
    ROUTES_WISH_LIST_VIEW: (BuildContext context) => WishListView(),
    ROUTES_CHECKOUT_VIEW: (BuildContext context) => CheckOut(),
    ROUTES_PREPARATION_VIEW: (BuildContext context) => Preparation(),
    ROUTES_VOICE_RECOGNIZER: (BuildContext context) => VoiceRecognizer(),
  };
  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(builder: ((BuildContext context) => Home()));
  };
}
