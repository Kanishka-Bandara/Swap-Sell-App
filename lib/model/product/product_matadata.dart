import 'package:swap_sell/kpackage/metadata_controller.dart';

enum ProductDealingType {
  ONLY_SELL,
  ONLY_BARTER,
  BARTER_AND_SELL,
}

class ProductDealingTypeController
    extends MetaDataController<ProductDealingType> {
  static Map<ProductDealingType, String> _indexMap = {
    ProductDealingType.ONLY_SELL: "Only Sell",
    ProductDealingType.ONLY_BARTER: "Only Exchange",
    ProductDealingType.BARTER_AND_SELL: "Sell & Exchange",
  };
  static ProductDealingTypeController defaultController =
      ProductDealingTypeController();
  ProductDealingTypeController() : super(_indexMap);

  @override
  int getIndexNumberByName(String name) {
    int _k;
    _indexMap.forEach((k, v) {
      if (name == v) {
        _k = k.index;
        return;
      }
    });
    return _k;
  }

  @override
  String getNameByIndexNumber(int indexNumber) {
    String _c;
    _indexMap.forEach((k, v) {
      if (indexNumber == k.index) {
        _c = v;
        return;
      }
    });
    return _c;
  }
}

enum ProductCondition {
  BRAND_NEW,
  USED,
}

class ProductConditionController extends MetaDataController<ProductCondition> {
  static Map<ProductCondition, String> _indexMap = {
    ProductCondition.BRAND_NEW: "Brand New",
    ProductCondition.USED: "Used",
  };
  static ProductConditionController defaultController = ProductConditionController();
  ProductConditionController() : super(_indexMap);

  @override
  String getNameByIndexNumber(int indexNumber) {
    String _c;
    _indexMap.forEach((k, v) {
      if (indexNumber == k.index) {
        _c = v;
        return;
      }
    });
    return _c;
  }

  @override
  int getIndexNumberByName(String condition) {
    int _k;
    _indexMap.forEach((k, v) {
      if (condition == v) {
        _k = k.index;
        return;
      }
    });
    return _k;
  }
}
