import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';

class AppIcons {
  static createShoppingCart(BuildContext context, String number) {
    return Badge(
      position: BadgePosition.topRight(top: 0, right: 3),
      badgeColor: Theme.of(context).primaryColor,
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        number,
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            AppNavigator.navigateToShoppingCart(context);
          }),
    );
  }
}
