import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/cart_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_dealing_status.dart';

class CartProduct extends Model {
  Product product;
  bool isSelected;
  int qty;
  DateTime addedDate;
  ProductDealingType dealingType;
  int status;
  CartProduct({
    @required this.product,
    @required this.isSelected,
    @required this.qty,
    @required this.dealingType,
    @required this.addedDate,
    @required this.status,
  });

  Product get getProduct => this.product;

  set setproduct(Product product) => this.product = product;

  bool get getIsSelected => isSelected;

  set setSelected(bool isSelected) {
    this.isSelected = isSelected;
    notifyListeners();
    CartController.defaultController.notifyListeners();
  }

  int get getQty => qty;

  set setQty(int qty) => this.qty = qty;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  void addQty(int qty) {
    int newQTy = this.getQty + qty;
    if (newQTy>0) {
      this.setQty = newQTy;
    }
    notifyListeners();
    CartController.defaultController.notifyListeners();
  }
}
