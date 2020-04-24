import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/product/cart_controller.dart';

class AppIcons {
  static createShoppingCart(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: ScopedModelDescendant<CartController>(
        builder: (BuildContext context, Widget widget, CartController model) {
          return GestureDetector(
            onTap: () {
              AppNavigator.navigateToShoppingCart(context);
            },
            child: Badge(
              position: BadgePosition.topRight(top: 0, right: 3),
              badgeColor: Theme.of(context).primaryColor,
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                "${model.getCartItemCount}",
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  AppNavigator.navigateToShoppingCart(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
