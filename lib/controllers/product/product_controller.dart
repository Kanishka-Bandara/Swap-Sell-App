import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
import 'package:swap_sell/model/product/ProductCategory.dart';
import 'package:swap_sell/model/product/product.dart';

class ProductController extends Model {
  Future<List<Category>> mainCategoryList;
  Future<List<Product>> savedProductList;
  Future<List<Product>> resentSearchedList;
  Future<List<Product>> resentArrivedProductList;
  Future<List<Product>> highestSoldProductList;

  static Future<List<Category>> getMainCategoryList() async {
    return await ProductExamples.getMainCategoryList();
  }

  static Future<List<Product>> getSearchedList(String query) async {
    return await ProductExamples.getSearchedList(query);
  }

  static Future<List<Product>> getSavedSearchedList() async {
    return ProductExamples.getList();
  }

  static Future<List<Product>> getRecentArrivedProductList() async {
    return await ProductExamples.getExampleProductList();
  }

  static Future<List<Product>> getHighestSoldProductList() async {
    return await ProductExamples.getExampleProductList();
  }
  static Future<List<Product>> getSimilarProducts(Product product) async {
    return await ProductExamples.getExampleProductList();
  }
}
