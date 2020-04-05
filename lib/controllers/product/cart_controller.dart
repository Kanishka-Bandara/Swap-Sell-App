import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/cart/cart_product.dart';

class CartController extends Model {
  List<List<CartProduct>> _cartProducts;

  // Future<List<List<CartProduct>>> get cartProductsList => _cartProducts;

  void addToCartProductList(CartProduct cartProduct) {
    bool _state = true;
    for (var i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i][0].product.shop.shopID == cartProduct.product.shop.shopID) {
        _cartProducts[i].add(cartProduct);
        _state = false;
      }
    }
    if (_state) {
      _cartProducts.add([cartProduct]);
    }
    notifyListeners();
  }
}
