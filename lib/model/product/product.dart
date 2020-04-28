import 'package:flutter/cupertino.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';

class Product {
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

  int get getid => id;

  set setid(int id) => id;

  String get getuniqueID => uniqueID;

  set setuniqueID(String value) => uniqueID = value;

  String get getname => name;

  set setname(String value) => name = value;

  double get getretailPrice => retailPrice;

  set setretailPrice(double value) => retailPrice = value;

  double get getBarterPrice => barterPrice;

  set setBarterPrice(double value) => barterPrice = value;

  double get getdelivaryPrice => delivaryPrice;

  set setdelivaryPrice(double value) => delivaryPrice = value;

  double get getdiscount {
    return double.parse(
        (((discountPrice) / retailPrice * 100)).toStringAsFixed(2));
  }

  List<String> get getimages => images;

  set setimages(List<String> value) => images = value;

  List<Image> get getnetworkImages {
    List<String> l = this.getimages;
    List<Image> images = List(l.length);
    for (var i = 0; i < l.length; i++) {
      images[i] = Image.network(l[i]);
    }
    return images;
  }

  set setnetworkImages(List<Image> value) => networkImages = value;

  String get getdescription => description;

  set setdescription(String value) => description = value;

  String get getWhatIsInTheBox => inTheBox;

  set setWhatIsInTheBox(String value) => inTheBox = value;

  double get getrating => rating;

  set setrating(double value) => rating = value;

  Map<String, String> get getspecifications => specifications;

  set setspecifications(Map<String, String> value) => specifications = value;

  int get getsaleCount => saleCount;

  set setsaleCount(int value) => saleCount = value;

  ProductDealingType get getDealingType => dealingState;

  set setDealingType(ProductDealingType value) => dealingState = value;

  int get getreturnCount => returnCount;

  set setreturnCount(int value) => returnCount = value;

  String get getheadCategory => headCategory;

  set setheadCategory(String value) => headCategory = value;

  String get getmainCategory => mainCategory;

  set setmainCategory(String value) => mainCategory = value;

  String get getsubCategory => subCategory;

  set setsubCategory(String value) => subCategory = value;

  ProductCondition get getcondition => condition;

  set setcondition(ProductCondition value) => condition = value;

  String get getmodel => model;

  set setmodel(String value) => model = value;

  String get getbrand => brand;

  set setbrand(String value) => brand = value;

  Shop get getshop => shop;

  set setshop(Shop value) => shop = value;

  bool get getisFavorite => isFavorite;

  set setisFavorite(bool value) => isFavorite = value;

  String get getcurrancy => currancy;

  set setcurrancy(String value) => currancy = value;

  int get getqty => qty;

  set setqty(int value) => qty = value;

  double get getdiscountedRetailPrice => discountPrice;

  set setdiscountedRetailPrice(double value) => discountPrice = value;

  String get getdisplayRetailPrice {
    return Currency.convertToCurrency(retailPrice);
  }

  String get getdisplayBarterPrice {
    return Currency.convertToCurrency(barterPrice);
  }

  String get getdisplayDiscountedRetailPrice {
    return Currency.convertToCurrency(
        getretailPrice - getdiscountedRetailPrice);
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
