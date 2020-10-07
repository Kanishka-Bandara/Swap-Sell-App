import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/product/product_controller.dart';
import 'package:swap_sell/sample_data/ProductExample.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/user/user.dart';

class OwnerProductsController extends Model {
  static OwnerProductsController defaultController = OwnerProductsController();
  List<Product> _ownerProductList = [];

  Future<List<Product>> getOwnerProductList(User owner) async {
    _ownerProductList = await ProductExamples.getExampleProductList();
    //TODO: get data from backend
    return _ownerProductList;
  }

  Future<List<Product>> getCurrentOwnerProductList() async {
    return await getOwnerProductList(AppInit.currentApp.getCurrentUser);
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

  Future<bool> addToOwnerProductsList(
      Product product, List<File> _imgFiles) async {
    Product saveProduct = await ProductController.defaultController
        .saveProduct(product, _imgFiles);
    if (saveProduct != null) {
      _ownerProductList.add(product);
      notifyListeners();
      return true;
    } else {
      return false;
    }
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

  Future<List<Product>> get getExchangableOwnerProducts async {
    return getCurrentOwnerProductList();
  }
}
