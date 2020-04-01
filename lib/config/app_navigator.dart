import 'package:flutter/material.dart';
import 'package:swap_sell/config/routs.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/pages/product_view.dart';
import 'package:swap_sell/ui/pages/search_page.dart';

class AppNavigator extends Navigator {
  static navigateToHomePage(BuildContext context) {
    // Navigator.of(context).pushNamed(Routes.ROUTES_HOME);
    Navigator.of(context).popUntil(ModalRoute.withName(Routes.ROUTES_HOME));
  }

  static navigateToSearchPage(BuildContext context) {
    showSearch(context: context, delegate: SearchPage());
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
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Routes.ROUTES_NOTIFICATION_VIEW);
  }

  static navigateToShoppingCart(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.ROUTES_SHOPPING_CART);
  }
}
