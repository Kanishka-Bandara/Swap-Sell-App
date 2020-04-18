import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
import 'package:swap_sell/model/product/ProductCategory.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/user/user.dart';

class ProductController extends Model {
  static ProductController defaultController = ProductController();
  List<Category> mainCategoryList;
  List<Product> savedProductList;
  List<Product> ownerProductList;
  List<Product> resentSearchedList;
  List<Product> resentArrivedProductList;
  List<Product> highestSoldProductList;

  Future<List<Category>> getMainCategoryList() async {
    mainCategoryList = await ProductExamples.getMainCategoryList();
    return mainCategoryList;
  }

  Future<List<Product>> getSearchedList(
    String query,
  ) async {
    return await ProductExamples.getSearchedList(query);
  }

  Future<List<Product>> getSavedSearchedList() async {
    //TODO:: must remove
    return ProductExamples.getList();
  }

  Future<List<Product>> getRecentArrivedProductList() async {
    resentArrivedProductList = await ProductExamples.getExampleProductList();
    return resentArrivedProductList;
  }

  Future<List<Product>> getHighestSoldProductList() async {
    highestSoldProductList = await ProductExamples.getExampleProductList();
    return highestSoldProductList;
  }

  Future<List<Product>> getOwnerProductList(
    User owner,
  ) async {
    ownerProductList = await ProductExamples.getExampleProductList();
    return ownerProductList;
  }

  Future<List<Product>> getFilterdOwnerProductList(
    User owner,
    String query,
  ) async {
    if (ownerProductList.isEmpty) {
      ownerProductList = await getOwnerProductList(owner);
    }
    return Future.delayed(
        Duration(seconds: 2),
        () => ownerProductList
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList());
  }

  Future<List<Product>> getSimilarProducts(
    Product product,
  ) async {
    return await ProductExamples.getExampleProductList();
  }
}
