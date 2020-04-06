import 'package:flutter/material.dart';
import 'package:swap_sell/config/routs.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/pages/chat_view.dart';
import 'package:swap_sell/ui/pages/product_view.dart';
import 'package:swap_sell/ui/pages/search_page.dart';

class AppNavigator extends Navigator {
  static navigateToHomePage(BuildContext context) {
    // Navigator.of(context).pushNamed(Routes.ROUTES_HOME);
    Navigator.of(context).popUntil(ModalRoute.withName(Routes.ROUTES_HOME));
  }

  static navigateToSearchPage(BuildContext context,String query) {
    showSearch(context: context, delegate: SearchPage(),query: query);
  }

  static navigateToSignInPage(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.ROUTES_HOME);
  }

  static navigateToProductViewPage(BuildContext context, Product p) {
    ProductView.currentProduct = p;
    Navigator.of(context).pushNamed(Routes.ROUTES_PRODUCT_VIEW);
  }

  static navigateToNotificationViewPage(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Routes.ROUTES_NOTIFICATION_VIEW);
  }

  static navigateToMessageViewPage(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Routes.ROUTES_MESSAGE_LIST_VIEW);
  }

  static navigateToChatViewPage(BuildContext context, UserMessage userMessage) {
    ChatView.userMessage = userMessage;
    Navigator.of(context).pushNamed(Routes.ROUTES_CHAT_VIEW);
  }

  static navigateToSavedViewPage(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Routes.ROUTES_SAVED_VIEW);
  }

  static navigateToShoppingCart(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.ROUTES_SHOPPING_CART);
  }
}
