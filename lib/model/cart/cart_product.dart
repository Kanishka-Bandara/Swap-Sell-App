import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product.dart';

class CartProduct {
  Product p;
  bool isSelected;
  int qty;
  DateTime addedDate;

  CartProduct(
      {@required this.p,
      @required this.isSelected,
      @required this.qty,
      @required this.addedDate});
}
