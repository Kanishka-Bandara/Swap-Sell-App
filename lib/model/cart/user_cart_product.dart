import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/shop/shop.dart';

class UserCartProduct extends Model{
  Shop shop;
  List<CartProduct> cartProducts = [];

  UserCartProduct({
    @required this.shop,
    @required this.cartProducts,
  });

  Shop get getShop => this.shop;

  set setShop(Shop shop) => this.shop = shop;

  List<CartProduct> get getCartProducts => this.cartProducts;

  set setCartProducts(List<CartProduct> cartProducts) =>
      this.cartProducts = cartProducts;
}
