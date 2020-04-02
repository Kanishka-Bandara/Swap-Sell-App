import 'package:flutter/material.dart';
import 'package:swap_sell/ui/pages/message_view.dart';
import 'package:swap_sell/ui/pages/notification_view.dart';
import 'package:swap_sell/ui/pages/product_view.dart';
import 'package:swap_sell/ui/pages/home.dart';
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
  static const String ROUTES_MESSAGE_VIEW = '/messageView';

  static final Map<String, WidgetBuilder> routes = {
    ROUTES_HOME: (BuildContext context) => Home(),
    ROUTES_SIGNIN: (BuildContext context) => Signin(),
    ROUTES_PRODUCT_VIEW: (BuildContext context) => ProductView(),
    ROUTES_NOTIFICATION_VIEW: (BuildContext context) => NotificationView(),
    ROUTES_MESSAGE_VIEW: (BuildContext context) => MessageView(),
    ROUTES_SHOPPING_CART: (BuildContext context) => ShoppingCart(),
  };
  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(builder: ((BuildContext context) => Home()));
  };
}