import 'package:swap_sell/model/cart/cart_product.dart';

class CartAPIManager {
  static CartAPIManager defaultManager = new CartAPIManager();

  Future<bool> saveCartProduct(CartProduct cartProduct) async {
    // TODO :: Send to backend
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<List<int>> a(List<int> ids) async {
    return null;
  }
}
