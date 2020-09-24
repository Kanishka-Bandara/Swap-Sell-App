import 'package:swap_sell/model/product/product_head_category.dart';
import 'package:swap_sell/model/product/product_main_category.dart';
import 'package:swap_sell/model/product/product_sub_category.dart';

class ProductCategoriesSamples {
  static List<HeadCategory> _headCats = [];
  static List<MainCategory> _mainCats = [];
  static List<SubCategory> _subCats = [];
  static List<HeadCategory> get productHeadCategories {
    if (_headCats == null || _headCats.length <= 0) {
      _loadHeadCategories();
    }
    return _headCats;
  }

  static List<MainCategory> get productMainCategories {
    if (_mainCats == null || _mainCats.length <= 0) {
      _loadMainCategories();
    }
    return _mainCats;
  }

  static List<SubCategory> get productSubCategories {
    if (_subCats == null || _subCats.length <= 0) {
      _loadSubCategories();
    }
    return _subCats;
  }

  static _loadHeadCategories() {
    for (var i = 0; i < 10; i++) {
      _headCats.add(
        HeadCategory(
          (i + 1),
          "H Cat $i",
          null,
        ),
      );
    }
  }

  static _loadMainCategories() {
    for (var i = 0; i < 10; i++) {
      _mainCats.add(
        MainCategory(
          (i + 1),
          "M Cat $i",
          null,
        ),
      );
    }
  }

  static _loadSubCategories() {
    for (var i = 0; i < 10; i++) {
      _subCats.add(
        SubCategory(
          (i + 1),
          "S Cat $i",
          null,
        ),
      );
    }
  }
}
