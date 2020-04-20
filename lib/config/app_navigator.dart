import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swap_sell/config/routs.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/pages/chat_view.dart';
import 'package:swap_sell/ui/pages/created_product_view.dart';
import 'package:swap_sell/ui/pages/product_view.dart';
import 'package:swap_sell/ui/pages/search_page.dart';

class AppNavigator extends Navigator {
  static navigateToHomePage(BuildContext context) {
    // Navigator.of(context).pushNamed(Routes.ROUTES_HOME);
    // Navigator.of(context).popUntil(ModalRoute.withName(Routes.ROUTES_HOME));
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.ROUTES_HOME,
      (Route<dynamic> route) => false,
    );
  }

  static navigateToSearchPage(
    BuildContext context,
    String query,
    bool removePreviouse,
  ) {
    if (removePreviouse) {
      Navigator.of(context).pop();
    }
    showSearch(context: context, delegate: SearchPage(), query: query);
  }

  static navigateToSignInPage(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.ROUTES_SIGNIN);
  }

  static navigateToSignUpPage(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.ROUTES_SIGNUP);
  }

  static navigateToProductViewPage(
    BuildContext context,
    Product p,
  ) {
    ProductView.currentProduct = p;
    Navigator.of(context).pushNamed(Routes.ROUTES_PRODUCT_VIEW);
  }
  
  static navigateToProfileOverviewPage(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.ROUTES_PROFILE_VIEW);
  }

  static navigateToProductDummyViewPage(
    BuildContext context,
    Product p,
    List<File> images,
  ) {
    CreatedProductView.currentProduct = p;
    Navigator.of(context).pushNamed(Routes.ROUTES_PRODUCT_DUMMY_VIEW);
  }

  static navigateToProductManagementPage(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.ROUTES_PRODUCT_MANAGEMENT);
  }

  static navigateToNotificationViewPage(
    BuildContext context,
  ) {
    // Navigator.of(context).pop();
    // Navigator.of(context).pushNamed(Routes.ROUTES_NOTIFICATION_VIEW);
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.ROUTES_NOTIFICATION_VIEW, (Route<dynamic> route) => false);
  }

  static navigateToMessageViewPage(
    BuildContext context,
  ) {
    // Navigator.of(context).pop();
    // Navigator.of(context).pushNamed(Routes.ROUTES_MESSAGE_LIST_VIEW);
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.ROUTES_MESSAGE_LIST_VIEW,
      (Route<dynamic> route) => false,
    );
  }

  static navigateToChatViewPage(
    BuildContext context,
    UserMessage userMessage,
  ) {
    ChatView.userMessage = userMessage;
    Navigator.of(context).pushNamed(Routes.ROUTES_CHAT_VIEW);
  }

  static navigateToSavedViewPage(
    BuildContext context,
  ) {
    // Navigator.of(context).pop();
    // Navigator.of(context).pushNamed(Routes.ROUTES_SAVED_VIEW);
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.ROUTES_SAVED_VIEW,
      (Route<dynamic> route) => false,
    );
  }

  static navigateToShoppingCart(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.ROUTES_SHOPPING_CART);
  }
}
