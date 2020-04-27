import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/product/wished_product.dart';

class WishListProductsController extends Model {
  static WishListProductsController defaultController = WishListProductsController();
  List<WishedProduct> _wishList = [];

  Future<List<WishedProduct>> getSavedWishList() async {
    return Future.delayed(Duration(seconds: 2), () => _wishList);
  }

  Future<bool> addToSavedWishList(WishedProduct wishedProduct) async {
    bool status = true;
    //Send to backend
    if (status) {
      _wishList.add(wishedProduct);
      notifyListeners();
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  Future<bool> updateFromSavedWishList(WishedProduct oldWishedProduct,
      WishedProduct newWishedProduct, int index) async {
    bool status = true;
    //Send to backend
    if (status) {
      _wishList[index] = newWishedProduct;
      notifyListeners();
    }
    return status;
  }

  Future<bool> removeFromSavedWishList(WishedProduct wishedProduct, int index) async {
    bool status = true;
    //Send to backend
    if (status) {
      _wishList.removeAt(index);
      notifyListeners();
    }
    return status;
  }

  int getSavedWishListLength() {
    return _wishList.length;
  }
}
