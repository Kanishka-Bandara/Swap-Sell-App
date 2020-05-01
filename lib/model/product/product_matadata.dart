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
  static ProductConditionController defaultController =
      ProductConditionController();
  ProductConditionController() : super(_indexMap);
}
