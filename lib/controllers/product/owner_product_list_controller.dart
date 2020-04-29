import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/user/user.dart';

class OwnerProductsController extends Model {
  static OwnerProductsController defaultController = OwnerProductsController();
  List<Product> _ownerProductList = [];

  Future<List<Product>> getOwnerProductList(User owner) async {
    _ownerProductList = await ProductExamples.getExampleProductList();
    //TODO: get data from backend
    return _ownerProductList;
  }

  Future<List<Product>> getFilterdOwnerProductList(
      User owner, String query) async {
    if (_ownerProductList.isEmpty) {
      //TODO:get data from backend
      _ownerProductList = await getOwnerProductList(owner);
    }
    return Future.delayed(
        Duration(seconds: 1),
        () => _ownerProductList
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList());
  }

  Future<bool> addToOwnerProductsList(Product product) async {
    bool status = true;
    //TODO:Send to backend
    if (status) {
      _ownerProductList.add(product);
      notifyListeners();
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  Future<bool> updateFromOwnerProductsList(
      Product oldProduct, Product newProduct, int index) async {
    bool status = true;
    //TODO:Send to backend
    if (status) {
      _ownerProductList[index] = newProduct;
      notifyListeners();
    }
    return status;
  }

  Future<bool> deleteFromOwnerProductsList(Product product, int index) async {
    bool status = true;
    //TODO:Send to backend
    if (status) {
      _ownerProductList.removeAt(index);
      notifyListeners();
    }
    return status;
  }

  int getOwnerProductsListLength() {
    return _ownerProductList.length;
  }

 List<Product> get getExchangableOwnerProducts{
  return _ownerProductList.where((p){
     return p.getDealingType!=ProductDealingType.ONLY_SELL;
   }).toList();
 }

}
