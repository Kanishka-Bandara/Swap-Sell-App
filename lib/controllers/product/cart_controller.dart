import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/cart/user_cart_product.dart';
import 'package:swap_sell/model/product/product_dealing_status.dart';
import 'package:swap_sell/model/shop/shop.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';

enum _CartProductType {
  NEW_SHOP_WITH_NEW_PRODUCT,
  EXISTING_SHOP_WITH_NEW_PRODUCT,
  EXISTING_SHOP_WITH_EXISTING_PRODUCT,
}

class CartController extends Model {
  // CartController() {
  //   setData();
  // }
  static CartController defaultController = CartController();
  List<UserCartProduct> _cartProducts = [];

  void setData() {
    _cartProducts.add(
      UserCartProduct(
        shop: Shop(
          id: 0,
          shopID: "1",
          shopName: "Shop 1",
          owner: User(
              id: 0,
              userId: "u1",
              title: "Mr.",
              gender: "Male",
              fName: "User 1",
              lName: "U1",
              fullName: "User1 u1",
              activeState: 1,
              emails: [
                Email(
                    emailID: 0,
                    emailType: "Business",
                    email: "user1@gmail.com.c",
                    status: 1),
              ],
              country: "Sri Lanka",
              status: 1),
          status: 1,
        ),
        cartProducts: [
          CartProduct(
            product: ProductExamples.getList()[0],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            product: ProductExamples.getList()[1],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            product: ProductExamples.getList()[2],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
            product: ProductExamples.getList()[3],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
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
          owner: User(
              id: 1,
              userId: "u1",
              title: "Mr.",
              gender: "Male",
              fName: "User 1",
              lName: "U1",
              fullName: "User1 u1",
              activeState: 1,
              emails: [
                Email(
                    emailID: 1,
                    emailType: "Business",
                    email: "user1@gmail.com.c",
                    status: 1),
              ],
              country: "Sri Lanka",
              status: 1),
          status: 1,
        ),
        cartProducts: [
          CartProduct(
            product: ProductExamples.getList()[5],
            isSelected: true,
            qty: 1,
            dealingType: ProductDealingType.ONLY_SELL,
            addedDate: DateTime.now(),
            status: 1,
          ),
          CartProduct(
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
          if (_cartProducts[i].cartProducts[j].getProduct.getid ==
              cartProduct.getProduct.getid) {
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

  Future<List> get getCartProducts async {
    return Future.delayed(Duration(seconds: 1), () {
      return _cartProducts;
    });
  }
  
}
