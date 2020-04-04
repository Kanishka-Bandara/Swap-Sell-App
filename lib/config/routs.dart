import 'package:flutter/material.dart';
import 'package:swap_sell/ui/pages/chat_view.dart';
import 'package:swap_sell/ui/pages/message_list_view.dart';
import 'package:swap_sell/ui/pages/notification_view.dart';
import 'package:swap_sell/ui/pages/product_view.dart';
import 'package:swap_sell/ui/pages/home.dart';
import 'package:swap_sell/ui/pages/saved_view.dart';
import 'package:swap_sell/ui/pages/shopping_cart.dart';
import 'package:swap_sell/ui/pages/signin.dart';

class Routes {
  static const String ROUTES_HOME = '/';
  static const String ROUTES_SIGNIN = '/signin';
  static const String ROUTES_SIGNUP = '/signUp';
  static const String ROUTES_PROFILE = '/profile';
  static const String ROUTES_PRODUCT_VIEW = '/productView';
  static const String ROUTES_SHOPPING_CART = '/shoppingCart';
  static const String ROUTES_NOTIFICATION_VIEW = '/notificationView';
  static const String ROUTES_MESSAGE_LIST_VIEW = '/messageListView';
  static const String ROUTES_CHAT_VIEW = '/chatView';
  static const String ROUTES_SAVED_VIEW = '/savedView';

  static final Map<String, WidgetBuilder> routes = {
    ROUTES_HOME: (BuildContext context) => Home(),
    ROUTES_SIGNIN: (BuildContext context) => Signin(),
    ROUTES_PRODUCT_VIEW: (BuildContext context) => ProductView(),
    ROUTES_NOTIFICATION_VIEW: (BuildContext context) => NotificationView(),
    ROUTES_MESSAGE_LIST_VIEW: (BuildContext context) => MessageView(),
    ROUTES_CHAT_VIEW: (BuildContext context) => ChatView(),
    ROUTES_SAVED_VIEW: (BuildContext context) => SavedView(),
    ROUTES_SHOPPING_CART: (BuildContext context) => ShoppingCart(),
  };
  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(builder: ((BuildContext context) => Home()));
  };
}
