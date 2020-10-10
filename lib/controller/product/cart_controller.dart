import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/api_manager/cart_api_manager.dart';
import 'package:swap_sell/api_manager/product_api_manager.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/sample_data/ProductExample.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/cart/user_cart_product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';

enum _CartProductType {
  NEW_SHOP_WITH_NEW_PRODUCT,
  EXISTING_SHOP_WITH_NEW_PRODUCT,
  EXISTING_SHOP_WITH_EXISTING_PRODUCT,
}

class CartController extends Model {
  static CartController defaultController = CartController();
  List<UserCartProduct> _cartProducts = [];

  Future<List<UserCartProduct>> fetchData() async {
    _cartProducts = [];
    _cartProducts = await CartAPIManager.defaultManager.getUserCartProducts(
      AppInit.currentApp.getCurrentUser.getId,
    );
    notifyListeners();
    return _cartProducts;
  }

  bool get isSelectedAll {
    bool _selectedAll = true;
    _cartProducts.forEach((p) {
      p.getCartProducts.forEach((f) {
        if (!f.isSelected) {
          _selectedAll = false;
        }
      });
    });
    return _selectedAll;
  }

  Future<bool> setAllSelected(bool select) async {
    List<int> ids = [];
    _cartProducts.forEach((f) {
      f.getCartProducts.forEach((element) {
        ids.add(element.getId);
      });
    });
    bool status = await CartAPIManager.defaultManager
        .setAllSelected(AppInit.currentApp.getCurrentUser.getId, ids);
    if (status) {
      _cartProducts.forEach((f) {
        f.setAllProductSelected(select);
      });
      notifyListeners();
    }
    return status;
  }

  Future<bool> addToCartProduct(CartProduct cartProduct) async {
    _CartProductType type = _CartProductType.NEW_SHOP_WITH_NEW_PRODUCT;
    int ucpIndex;
    int cpIndex;
    for (var i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].getShop.getShopID ==
          cartProduct.product.shop.shopID) {
        type = _CartProductType.EXISTING_SHOP_WITH_NEW_PRODUCT;
        ucpIndex = i;
        for (var j = 0; j < _cartProducts[i].cartProducts.length; j++) {
          if (_cartProducts[i].cartProducts[j].getProduct.getId ==
              cartProduct.getProduct.getId) {
            type = _CartProductType.EXISTING_SHOP_WITH_EXISTING_PRODUCT;
            cpIndex = j;
          }
        }
      }
    }
    bool _state =
        await CartAPIManager.defaultManager.saveCartProduct(cartProduct);
    if (_state) {
      if (type == _CartProductType.NEW_SHOP_WITH_NEW_PRODUCT) {
        List<CartProduct> cp = [];
        cp.add(cartProduct);
        _cartProducts.add(
          UserCartProduct(shop: cartProduct.product.shop, cartProducts: cp),
        );
      } else if (type == _CartProductType.EXISTING_SHOP_WITH_NEW_PRODUCT) {
        _cartProducts[ucpIndex].cartProducts.add(cartProduct);
      } else if (type == _CartProductType.EXISTING_SHOP_WITH_EXISTING_PRODUCT) {
        _cartProducts[ucpIndex].cartProducts[cpIndex].setQty =
            _cartProducts[ucpIndex].cartProducts[cpIndex].getQty +
                cartProduct.getQty;
      }
      notifyListeners();
    }
    return _state;
  }

  int get getCartItemCount {
    int _count = 0;
    _cartProducts.forEach((p) {
      p.getCartProducts.forEach((f) {
        _count += f.getQty;
      });
    });
    return _count;
  }

  Future<List<UserCartProduct>> get getCartProducts async {
    return _cartProducts;
  }

  double get getCartTotal {
    double _total = 0;
    _cartProducts.forEach((p) {
      p.getCartProducts.forEach((f) {
        _total += (f.getQty * f.getProduct.getRetailPrice);
      });
    });
    return _total;
  }

  String get getDisplayCartTotal {
    return Currency.convertToCurrency(getCartTotal);
  }

  double getShopCartTotal(int index) {
    double _total = 0;
    _cartProducts.forEach((p) {
      p.getCartProducts.forEach((f) {
        _total += (f.getQty * f.getProduct.getDiscountedRetailPrice);
      });
    });
    return _total;
  }

  void removeSelectedFromTheShoppingCart() {
    print("]]]]]]]]]]]]]]]]]]]");
    _cartProducts.forEach((ucp) {
      ucp.getCartProducts.removeWhere((cp) {
        //TODO ::Send To Backend
        return cp.isSelected;
      });
    });
    _cartProducts.removeWhere((ucp) {
      return ucp.getCartProducts.length <= 0;
    });
    notifyListeners();
  }

  // void removeSelectedFromTheShoppingCart() async {
  //   _cartProducts.forEach((ucp) {
  //     ucp.getCartProducts.forEach((cp) async {
  //       print(cp.getId);
  //       if (cp.isSelected) {
  //         bool status = await CartAPIManager.defaultManager
  //             .deleteProductFromTheShoppingCart(
  //                 AppInit.currentApp.getCurrentUser.getId, cp);
  //         if (status) {
  //           ucp.getCartProducts.removeWhere((cp) {
  //             return cp.isSelected;
  //           });
  //         }
  //       }
  //     });
  //   });
  //   notifyListeners();
  //   _cartProducts.removeWhere((ucp) {
  //     print("===${ucp.getCartProducts.length}");
  //     return ucp.getCartProducts.length <= 0;
  //   });
  //   notifyListeners();
  // }

  Future<List<UserCartProduct>> get getSelectedCartProducts async {
    List<UserCartProduct> l = [];
    _cartProducts.forEach((ucp) {
      if (ucp.getSelectedAsClone.getCartProducts.length > 0) {
        l.add(ucp.getSelectedAsClone);
      }
    });
    return l;
  }

  int get getSelectedCartProductCount {
    int _c = 0;
    _cartProducts.forEach((ucp) {
      _c += ucp.getSelectedCount;
    });
    return _c;
  }

  bool get isAllSelectedAreBarterProducts {
    bool _c = false;
    _cartProducts.forEach((ucp) async {
      if (await ucp.isAllSelectedProductsAreBarterProducts) {
        _c = true;
        print(_c);
      }
    });
    return _c;
  }

  int get getSelectedBuyingCartProductQty {
    int _c = 0;
    _cartProducts.forEach((ucp) {
      _c += ucp.getSelectedBuyingProductsQty;
    });
    return _c;
  }

  int get getSelectedBarterCartProductQty {
    int _c = 0;
    _cartProducts.forEach((ucp) {
      _c += ucp.getSelectedBarterProductsQty;
    });
    return _c;
  }

  int get getSelectedCartProductQty {
    int _c = 0;
    _cartProducts.forEach((ucp) {
      _c += ucp.getSelectedProductsQty;
    });
    return _c;
  }

  double getSelectedCartProductsTotal(ProductDealingType productDealingType) {
    double _total = 0;
    _cartProducts.forEach((ucp) {
      _total += ucp.getSelectedProductsTotal(productDealingType);
    });
    return _total;
  }

  String getSelectedCartProductsTotalDisplay(
      ProductDealingType productDealingType) {
    return Currency.convertToCurrency(
        getSelectedCartProductsTotal(productDealingType));
  }

  double get getAllSelectedCartProductsTotal {
    double _total = 0;
    _cartProducts.forEach((ucp) {
      _total += ucp.getAllSelectedProductsTotal();
    });
    return _total;
  }

  String get getAllSelectedCartProductsTotalDisplay {
    return Currency.convertToCurrency(getAllSelectedCartProductsTotal);
  }

  double get getSelectedOwnerExchangingCartProductsTotal {
    double _total = 0;
    _cartProducts.forEach((ucp) {
      _total += ucp.getSelectedOwnerExchangingCartProductsTotal;
    });
    return _total;
  }

  String get getSelectedOwnerExchangingCartProductsTotalDisplay {
    return Currency.convertToCurrency(
        getSelectedOwnerExchangingCartProductsTotal);
  }

  double get getSelectedExchangingCartProductsDifference {
    return getSelectedCartProductsTotal(ProductDealingType.ONLY_BARTER) -
        getSelectedOwnerExchangingCartProductsTotal;
  }

  String get getSelectedExchangingCartProductsDifferenceDisplay {
    return Currency.convertToCurrency(
        getSelectedExchangingCartProductsDifference);
  }

  double get getTotalPayable {
    return getSelectedCartProductsTotal(ProductDealingType.ONLY_SELL) +
        getSelectedExchangingCartProductsDifference;
  }

  String get getTotalPayableDisplay {
    return Currency.convertToCurrency(getTotalPayable);
  }
}
