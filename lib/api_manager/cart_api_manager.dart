import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/cart/user_cart_product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';
import 'package:swap_sell/sample_data/ProductExample.dart';

class CartAPIManager {
  static CartAPIManager defaultManager = new CartAPIManager();

  Future<bool> saveCartProduct(CartProduct cartProduct) async {
    // TODO :: Send to backend
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<bool> setAllSelected(int userId, List<int> ids) async {
    // TODO :: Send to backend
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<List<UserCartProduct>> getUserCartProducts(int userId) async {
    // TODO :: Get data from backend
    return Future.delayed(Duration(seconds: 2), () => getData());
  }

  Future<bool> deleteProductFromTheShoppingCart(
      int userId, CartProduct cartProduct) async {
    // TODO::Send data to backend
    print("product ${cartProduct.getId} has been deleted from the cart");
    return true;
  }

  List<UserCartProduct> getData() {
    print("requested");
    List<UserCartProduct> _cartProducts = [];
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

    return _cartProducts;
  }
}
