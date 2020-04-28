import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';

class Product extends Model{
  int id;
  String uniqueID;
  String name;
  String headCategory;
  String mainCategory;
  String subCategory;
  String model;
  String brand;
  List<String> images;
  List<Image> networkImages;
  String description;
  Map<String, String> specifications = Map();
  ProductCondition condition = ProductCondition.BRAND_NEW;
  String inTheBox;
  double rating;
  int qty;
  String currancy;
  ProductDealingType dealingState;
  double barterPrice; //
  double retailPrice;
  double delivaryPrice;
  double discountPrice;
  int saleCount;
  int barterCount; //
  int returnCount;
  Shop shop;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.uniqueID,
    @required this.name,
    this.retailPrice = 0.0,
    this.barterPrice = 0.0,
    this.delivaryPrice = 0.0,
    this.discountPrice = 0.0,
    this.images,
    @required this.description,
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
    this.condition,
    this.model,
    this.brand,
    this.shop,
    this.isFavorite = false,
    this.currancy,
    this.dealingState = ProductDealingType.ONLY_SELL,
  });

  int get getId => id;

  set setId(int id) => id;

  String get getUniqueID => uniqueID;

  set setUniqueID(String value) => uniqueID = value;

  String get getName => name;

  set setName(String value) => name = value;

  double get getRetailPrice => retailPrice;

  set setRetailPrice(double value) => retailPrice = value;

  double get getBarterPrice => barterPrice;

  set setBarterPrice(double value) => barterPrice = value;

  double get getDelivaryPrice => delivaryPrice;

  set setDelivaryPrice(double value) => delivaryPrice = value;

  double get getDiscount {
    return double.parse(
        (((discountPrice) / retailPrice * 100)).toStringAsFixed(2));
  }

  List<String> get getImages => images;

  set setImages(List<String> value) => images = value;

  List<Image> get getnetworkImages {
    List<String> l = this.getImages;
    List<Image> images = List(l.length);
    for (var i = 0; i < l.length; i++) {
      images[i] = Image.network(l[i]);
    }
    return images;
  }

  set setNetworkImages(List<Image> value) => networkImages = value;

  String get getDescription => description;

  set setDescription(String value) => description = value;

  String get getWhatIsInTheBox => inTheBox;

  set setWhatIsInTheBox(String value) => inTheBox = value;

  double get getRating => rating;

  set setRating(double value) => rating = value;

  Map<String, String> get getSpecifications => specifications;

  set setSpecifications(Map<String, String> value) => specifications = value;

  int get getSaleCount => saleCount;

  set setSaleCount(int value) => saleCount = value;

  ProductDealingType get getDealingType => dealingState;

  set setDealingType(ProductDealingType value) => dealingState = value;

  int get getReturnCount => returnCount;

  set setReturnCount(int value) => returnCount = value;

  String get getHeadCategory => headCategory;

  set setHeadCategory(String value) => headCategory = value;

  String get getMainCategory => mainCategory;

  set setMainCategory(String value) => mainCategory = value;

  String get getSubCategory => subCategory;

  set setSubCategory(String value) => subCategory = value;

  ProductCondition get getCondition => condition;

  set setCondition(ProductCondition value) => condition = value;

  String get getModel => model;

  set setModel(String value) => model = value;

  String get getBrand => brand;

  set setBrand(String value) => brand = value;

  Shop get getShop => shop;

  set setShop(Shop value) => shop = value;

  bool get getIsFavorite => isFavorite;

  set setIsFavorite(bool value) => isFavorite = value;

  String get getCurrancy => currancy;

  set setCurrancy(String value) => currancy = value;

  int get getQty => qty;

  set setQty(int value) => qty = value;

  double get getDiscountedRetailPrice => discountPrice;

  set setDiscountedRetailPrice(double value) => discountPrice = value;

  String get getDisplayRetailPrice {
    return Currency.convertToCurrency(retailPrice);
  }

  String get getDisplayBarterPrice {
    return Currency.convertToCurrency(barterPrice);
  }

  String get getDisplayDiscountedRetailPrice {
    return Currency.convertToCurrency(
        getRetailPrice - getDiscountedRetailPrice);
  }

  bool get canOnlyBarter =>
      this.dealingState == ProductDealingType.ONLY_BARTER
          ? true
          : false;
  bool get canOnlySell =>
      this.dealingState == ProductDealingType.ONLY_SELL ? true : false;
  bool get canBarterAndSell =>
      this.dealingState == ProductDealingType.BARTER_AND_SELL
          ? true
          : false;
}
