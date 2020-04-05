import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product.dart';

class CartProduct {
  Product product;
  bool isSelected;
  int qty;
  DateTime addedDate;
  int status;
  CartProduct({
    @required this.product,
    @required this.isSelected,
    @required this.qty,
    @required this.addedDate,
    @required this.status,
  });

  bool get getIsSelected => isSelected;

  set setIsSelected(bool isSelected) => this.isSelected = isSelected;

  int get getQty => qty;

  set setQty(int qty) => this.qty = qty;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
