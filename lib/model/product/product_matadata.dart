import 'package:flutter/material.dart';

enum ProductDealingType {
  ONLY_SELL,
  ONLY_BARTER,
  BARTER_AND_SELL,
}

enum ProductCondition {
  BRAND_NEW,
  USED,
}

class ProductConditionController {
  static Map<ProductCondition, String> _conditions = {
    ProductCondition.BRAND_NEW: "Brand New",
    ProductCondition.USED: "Used",
  };
  static String getConditionNameByIndex(ProductCondition condition) {
    return _conditions[condition];
  }

  static String getConditionNameByIndexNumber(int indexNumber) {
    String _c;
    _conditions.forEach((k, v) {
      if (indexNumber == k.index) {
        _c = v;
        return;
      }
    });
    return _c;
  }

  static int getConditionIndexNumberByName(String condition) {
    int _k;
    _conditions.forEach((k, v) {
      if (condition == v) {
        _k = k.index;
        return;
      }
    });
    return _k;
  }

  static ProductCondition getConditionIndexByName(String condition) {
    ProductCondition _c;
    _conditions.forEach((k, v) {
      if (condition == v) {
        _c = k;
        return;
      }
    });
    return _c;
  }

  static List<DropdownMenuItem<ProductCondition>>
      getProductConditionsAsListForDropDown() {
    List<DropdownMenuItem<ProductCondition>> l = [];
    _conditions.forEach(
      (k, v) {
        l.add(
          DropdownMenuItem(
            child: Row(
              children: <Widget>[
                Text(getConditionNameByIndex(k)),
              ],
            ),
            value: k,
          ),
        );
      },
    );
    return l;
  }
}
