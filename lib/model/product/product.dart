import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/business/business.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';

class Product extends Model {
  int id;
  String uniqueID;
  String name;
  int headCategoryId; //
  int mainCategoryId; //
  int subCategoryId; //
  String headCategory;
  String mainCategory;
  String subCategory;
  String model;
  int brandId; //
  String brand;
  List<String> images;
  List<Image> networkImages;
  String description;
  String barcode;
  Map<String, String> specifications = Map();
  int conditionId; //
  ProductCondition condition = ProductCondition.BRAND_NEW;
  String inTheBox;
  double rating;
  int qty;
  int currencyId; //
  String currency;
  int dealingStateId; //
  ProductDealingType dealingState = ProductDealingType.ONLY_SELL;
  double barterPrice;
  double retailPrice;
  double deliveryPrice;
  int discountId; //
  double discountPrice;
  int saleCount;
  int barterCount;
  int returnCount;
  Shop shop;
  int isFavorite;
  int status;

  Product({
    @required this.id,
    @required this.uniqueID,
    @required this.name,
    this.retailPrice = 0.0,
    this.barterPrice = 0.0,
    this.deliveryPrice = 0.0,
    this.discountPrice = 0.0,
    this.images,
    @required this.description,
    this.barcode,
    this.inTheBox,
    this.rating = 0.0,
    this.qty = 0,
    this.specifications = const {},
    this.saleCount = 0,
    this.barterCount = 0,
    this.returnCount = 0,
    this.headCategory,
    this.mainCategory,
    this.subCategory,
    this.condition = ProductCondition.BRAND_NEW,
    this.model,
    this.brand,
    this.shop,
    this.isFavorite = 0,
    this.currency,
    this.dealingState = ProductDealingType.ONLY_SELL,
    this.headCategoryId,
    this.mainCategoryId,
    this.subCategoryId,
    this.brandId,
    this.conditionId,
    this.currencyId,
    this.dealingStateId,
    this.discountId,
  });

  int get getId => id;

  set setId(int id) {
    this.id = id;
    //notifyListeners();
  }

  String get getUniqueID => uniqueID;

  set setUniqueID(String value) {
    this.uniqueID = value;
    //notifyListeners();
  }

  String get getName => name;

  set setName(String value) {
    this.name = value;
    //notifyListeners();
  }

  double get getRetailPrice => retailPrice;

  set setRetailPrice(double value) {
    this.retailPrice = value;
    //notifyListeners();
  }

  double get getBarterPrice => barterPrice;

  set setBarterPrice(double value) {
    this.barterPrice = value;
    //notifyListeners();
  }

  double get getDeliveryPrice => deliveryPrice;

  set setDeliveryPrice(double value) {
    this.deliveryPrice = value;
    //notifyListeners();
  }

  double get getDiscount {
    return double.parse(
        (((discountPrice) / getRetailPrice * 100)).toStringAsFixed(2));
  }

  List<String> get getImages => images;

  set setImages(List<String> value) {
    this.images = value;
    //notifyListeners();
  }

  List<Image> get getnetworkImages {
    List<String> l = this.getImages;
    List<Image> images = List(l.length);
    for (var i = 0; i < l.length; i++) {
      images[i] = Image.network(l[i]);
    }
    return images;
  }

  set setNetworkImages(List<Image> value) {
    this.networkImages = value;
    //notifyListeners();
  }

  String get getDescription => description;

  set setDescription(String value) {
    this.description = value;
    //notifyListeners();
  }

  String get getBarcode => barcode;

  set setBarcode(String value) {
    this.barcode = value;
    //notifyListeners();
  }

  String get getWhatIsInTheBox => inTheBox;

  set setWhatIsInTheBox(String value) {
    this.inTheBox = value;
    //notifyListeners();
  }

  double get getRating => rating;

  set setRating(double value) {
    this.rating = value;
    //notifyListeners();
  }

  Map<String, String> get getSpecifications => specifications;

  set setSpecifications(Map<String, String> value) {
    this.specifications = value;
    //notifyListeners();
  }

  int get getSaleCount => saleCount;

  set setSaleCount(int value) {
    this.saleCount = value;
    //notifyListeners();
  }

  ProductDealingType get getDealingType => dealingState;

  set setDealingType(ProductDealingType value) {
    this.dealingState = value;
    //notifyListeners();
  }

  int get getReturnCount => returnCount;

  set setReturnCount(int value) {
    this.returnCount = value;
    //notifyListeners();
  }

  String get getHeadCategory => headCategory;

  set setHeadCategory(String value) {
    this.headCategory = value;
    //notifyListeners();
  }

  String get getMainCategory => mainCategory;

  set setMainCategory(String value) {
    this.mainCategory = value;
    //notifyListeners();
  }

  String get getSubCategory => subCategory;

  set setSubCategory(String value) {
    this.subCategory = value;
    //notifyListeners();
  }

  ProductCondition get getCondition => condition;

  set setCondition(ProductCondition value) {
    this.condition = value;
    //notifyListeners();
  }

  String get getModel => model;

  set setModel(String value) {
    this.model = value;
    //notifyListeners();
  }

  String get getBrand => brand;

  set setBrand(String value) {
    this.brand = value;
    //notifyListeners();
  }

  Shop get getShop => shop;

  set setShop(Shop value) {
    this.shop = value;
    //notifyListeners();
  }

  bool get getIsFavorite => isFavorite == 1;

  set setIsFavorite(bool value) {
    value == true ? this.isFavorite = 1 : this.isFavorite = 0;
    //notifyListeners();
  }

  String get getCurrency => currency;

  set setCurrency(String value) {
    this.currency = value;
    //notifyListeners();
  }

  int get getQty => qty;

  set setQty(int value) {
    this.qty = value;
    //notifyListeners();
  }

  double get getDiscountPrice => discountPrice;

  set setDiscountePrice(double value) {
    this.discountPrice = value;
    //notifyListeners();
  }

  double get getOwnerPrice =>
      getOwnerPrice *
      (100 - Business.PRODUCT_PRICE_PERCENTAGE_FOR_BUSINESS) /
      100;

  String get getDisplayRetailPrice {
    return Currency.convertToCurrency(getRetailPrice);
  }

  String get getDisplayBarterPrice {
    return Currency.convertToCurrency(barterPrice);
  }

  double get getDiscountedRetailPrice => getRetailPrice - getDiscountPrice;

  String get getDisplayDiscountedRetailPrice {
    return Currency.convertToCurrency(getDiscountedRetailPrice);
  }

  int get getStatus => status;

  set setStatus(int status) {
    this.status = status;
    //notifyListeners();
  }

  bool get canOnlyBarter =>
      this.dealingState == ProductDealingType.ONLY_BARTER ? true : false;
  bool get canOnlySell =>
      this.dealingState == ProductDealingType.ONLY_SELL ? true : false;
  bool get canBarterAndSell =>
      this.dealingState == ProductDealingType.BARTER_AND_SELL ? true : false;
}
