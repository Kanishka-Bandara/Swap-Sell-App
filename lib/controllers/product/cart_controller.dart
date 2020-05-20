import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
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
  CartController() {
    setData();
  }
  static CartController defaultController = CartController();
  List<UserCartProduct> _cartProducts = [];

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

  void setAllSelected(bool select) {
    _cartProducts.forEach((f) {
      f.setAllProductSelected(select);
    });
    notifyListeners();
  }

  void setData() {
    _cartProducts.add(
      UserCartProduct(
        shop: Shop(
          id: 0,
          shopID: "1",
          shopName: "Shop 1",
          ownerId: 1,
          status: 1,
        ),
        cartProducts: [
          CartProduct(
            id: 1,
            product: ProductExamples.getList()[0],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            id: 2,
            product: ProductExamples.getList()[1],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            id: 3,
            product: ProductExamples.getList()[2],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            id: 4,
            product: ProductExamples.getList()[3],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            id: 5,
            product: ProductExamples.getList()[4],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
        ],
      ),
    );

    _cartProducts.add(
      UserCartProduct(
        shop: Shop(
          id: 1,
          shopID: "1",
          shopName: "Shop 2",
          ownerId: 1,
          status: 1,
        ),
        cartProducts: [
          CartProduct(
            id: 6,
            product: ProductExamples.getList()[5],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            id: 7,
            product: ProductExamples.getList()[6],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
        ],
      ),
    );
  }

  // Future<List<List<CartProduct>>> get cartProductsList => _cartProducts;

  bool addToCartProductList(CartProduct cartProduct) {
    _CartProductType type = _CartProductType.NEW_SHOP_WITH_NEW_PRODUCT;
    int ucpIndex;
    int cpIndex;
    bool _state = true;
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
    // TODO::SEND TO BACK END
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
    } else {
      _state = false;
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
    return Future.delayed(Duration(seconds: 1), () {
      return _cartProducts;
    });
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

  // Future<List<UserCartProduct>> get getSelectedCartProducts async {
  //   List<UserCartProduct> l = [];
  //   _cartProducts.forEach((ucp) {
  //     if (ucp.getSelectedAsClone.getCartProducts.length > 0) {
  //       l.add(ucp.getSelectedAsClone);
  //     }
  //   });
  //   return l;
  // }

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
