import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/cart_controller.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';

class CartProduct extends Model {
  int id;
  Product product;
  bool isSelected;
  int qty;
  DateTime addedDate;
  ProductDealingType dealingType;
  Product exchangingProduct;
  int exchangingQty;
  int status;
  CartProduct(
      {@required this.id,
      @required this.product,
      @required this.isSelected,
      @required this.qty,
      @required this.dealingType,
      @required this.addedDate,
      @required this.status,
      this.exchangingProduct,
      this.exchangingQty});

  int get getId => this.id;

  set setId(int id) => this.id = id;

  Product get getProduct => this.product;

  set setproduct(Product product) => this.product = product;

  Product get getExchangingProduct => this.exchangingProduct;

  set setExchangingproduct(Product product) => this.exchangingProduct = product;

  ProductDealingType get getProductDealingType => this.dealingType;

  set setProductDealingType(ProductDealingType dealingType) => this.dealingType = dealingType;

  bool get getIsSelected => isSelected;

  set setSelected(bool isSelected) {
    this.isSelected = isSelected;
    notifyListeners();
    CartController.defaultController.notifyListeners();
  }

  int get getQty => qty;

  set setQty(int qty) => this.qty = qty;

  int get getExchangingQty => exchangingQty;

  set setExchangingQty(int qty) => this.exchangingQty = qty;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  void addQty(int qty) {
    int _newQTy = this.getQty + qty;
    if (_newQTy > this.getProduct.getQty) {
      _newQTy = this.getProduct.getQty;
    }
    if (_newQTy > 0) {
      this.setQty = _newQTy;
    }
    notifyListeners();
    CartController.defaultController.notifyListeners();
  }

  void addExchangingQty(int qty) {
    int _newQTy = this.getExchangingQty + qty;
    if (_newQTy > this.getExchangingProduct.getQty) {
      _newQTy = this.getExchangingProduct.getQty;
    }
    if (_newQTy > 0) {
      this.setExchangingQty = _newQTy;
    }
    notifyListeners();
    CartController.defaultController.notifyListeners();
  }

  CartProduct get getClone {
    return CartProduct(
      id: this.id,
      product: this.product,
      isSelected: this.isSelected,
      qty: this.qty,
      dealingType: this.dealingType,
      addedDate: this.addedDate,
      status: this.status,
    );
  }

  double get getBuyingTotal {
    return this.qty * this.getProduct.getDiscountedRetailPrice;
  }

  String get getBuyingTotalDisplay {
    return Currency.convertToCurrency(getBuyingTotal);
  }
}
