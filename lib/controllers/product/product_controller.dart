import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_main_category.dart';

class ProductController extends Model {
  static ProductController defaultController = ProductController();
  List<MainCategory> mainCategoryList;
  List<Product> savedProductList;
  List<Product> resentSearchedList;
  List<Product> resentArrivedProductList;
  List<Product> highestSoldProductList;

  Future<List<MainCategory>> getHeadCategoryList() async {
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

  Future<List<Product>> getSimilarProducts(
    Product product,
  ) async {
    return await ProductExamples.getExampleProductList();
  }
}
