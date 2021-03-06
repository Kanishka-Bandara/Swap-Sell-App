import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';

class UserCartProduct extends Model {
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
  bool get isAllProductSelected {
    bool _selected = true;
    cartProducts.forEach((f) {
      if (!f.isSelected) {
        _selected = false;
      }
    });
    return _selected;
  }

  void setAllProductSelected(bool select) {
    cartProducts.forEach((f) {
      f.setSelected = select;
    });
    notifyListeners();
  }

  void removeFromTheShoppingCart(CartProduct cp) {
    // List<CartProduct> newCartProducts = [];
    // for (var i = 0; i < cartProducts.length; i++) {
    //   if (i!=cartProductIndex) {
    //     newCartProducts.add(value)
    //   }
    // }
    cartProducts.removeWhere((CartProduct _cp) {
      return _cp.getId == _cp.getId;
    });
  }

  UserCartProduct get getClone {
    List<CartProduct> cps = [];
    this.cartProducts.forEach((cp) {
      cps.add(cp.getClone);
    });
    UserCartProduct ucp = UserCartProduct(shop: this.shop, cartProducts: cps);
    return ucp;
  }

  UserCartProduct get getSelectedAsClone {
    List<CartProduct> cps = [];
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        cps.add(cp.getClone);
      }
    });
    UserCartProduct ucp = UserCartProduct(shop: this.shop, cartProducts: cps);
    return ucp;
  }

  int get getSelectedCount {
    int count = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        count++;
      }
    });
    return count;
  }

  int get getSelectedBuyingProductsQty {
    int count = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        if (cp.getProductDealingType == ProductDealingType.ONLY_SELL) {
          count += cp.getQty;
        }
      }
    });
    return count;
  }

  int get getSelectedBarterProductsQty {
    int count = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        if (cp.getProductDealingType == ProductDealingType.ONLY_BARTER) {
          count += cp.getQty;
        }
      }
    });
    return count;
  }

  int get getSelectedProductsQty {
    int count = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        count += cp.getQty;
      }
    });
    return count;
  }

  Future<bool> get isAllSelectedProductsAreBarterProducts async {
    bool _c = true;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        if (cp.getProductDealingType != ProductDealingType.ONLY_BARTER) {
          _c = false;
          print("c = ${cp.getProductDealingType}");
          return;
        }
      }
    });
    return _c;
  }

  double getAllSelectedProductsTotal() {
    double _t = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        _t += cp.getBuyingTotal;
      }
    });
    return _t;
  }

  String getAllSelectedProductsTotalDisplay() {
    return Currency.convertToCurrency(getAllSelectedProductsTotal());
  }

  double getSelectedProductsTotal(ProductDealingType productDealingType) {
    double _t = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        if (cp.getProductDealingType == productDealingType) {
          _t += cp.getBuyingTotal;
        }
      }
    });
    return _t;
  }

  String getSelectedProductsTotalDisplay(
      ProductDealingType productDealingType) {
    return Currency.convertToCurrency(
        getSelectedProductsTotal(productDealingType));
  }

  double get getSelectedOwnerExchangingCartProductsTotal {
    double _t = 0;
    this.cartProducts.forEach((cp) {
      if (cp.isSelected) {
        _t += cp.getOwnerExchangingTotal;
      }
    });
    return _t;
  }

  String get getSelectedOwnerExchangingCartProductsTotalDisplay {
    return Currency.convertToCurrency(
        getSelectedOwnerExchangingCartProductsTotal);
  }
}
