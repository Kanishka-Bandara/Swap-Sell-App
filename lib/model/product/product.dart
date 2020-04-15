import 'package:flutter/cupertino.dart';
import 'package:swap_sell/kpackage/currency.dart';
import 'package:swap_sell/model/shop/shop.dart';

class Product {
  int id;
  String uniqueID;
  String name;
  double retailPrice;
  double delivaryPrice;
  double discountPrice;
  List<String> images;
  List<Image> networkImages;
  String description;
  double rating;
  int qty;
  Map<String, String> specifications = Map();
  int saleCount;
  int returnCount;
  String headCategory;
  String mainCategory;
  String subCategory;
  String condition;
  String model;
  String brand;
  Shop shop;
  bool isFavorite;
  String currancy;
  bool canBarter;

  Product({
    this.id,
    this.uniqueID,
    this.name,
    this.retailPrice,
    this.delivaryPrice,
    this.discountPrice,
    this.images,
    this.description,
    this.rating,
    this.qty,
    this.specifications = const {},
    this.saleCount,
    this.returnCount,
    this.headCategory,
    this.mainCategory,
    this.subCategory,
    this.condition,
    this.model,
    this.brand,
    this.shop,
    this.isFavorite,
    this.currancy,
    this.canBarter = false,
  });

  int get getid => id;

  set setid(int id) => id;

  String get getuniqueID => uniqueID;

  set setuniqueID(String value) => uniqueID = value;

  String get getname => name;

  set setname(String value) => name = value;

  double get getretailPrice => retailPrice;

  set setretailPrice(double value) => retailPrice = value;

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

  double get getrating => rating;

  set setrating(double value) => rating = value;

  Map<String, String> get getspecifications => specifications;

  set setspecifications(Map<String, String> value) => specifications = value;

  int get getsaleCount => saleCount;

  set setsaleCount(int value) => saleCount = value;

  int get getreturnCount => returnCount;

  set setreturnCount(int value) => returnCount = value;

  String get getheadCategory => headCategory;

  set setheadCategory(String value) => headCategory = value;

  String get getmainCategory => mainCategory;

  set setmainCategory(String value) => mainCategory = value;

  String get getsubCategory => subCategory;

  set setsubCategory(String value) => subCategory = value;

  String get getcondition => condition;

  set setcondition(String value) => condition = value;

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

  String get getdisplayRetailPrice {
    return Currency.convertToCurrency(retailPrice);
  }

  double get getdiscountedRetailPrice {
    return discountPrice;
  }

  set setdiscountedRetailPrice(double value) => discountPrice = value;

  String get getdisplayDiscountedRetailPrice {
    return Currency.convertToCurrency(
        getretailPrice - getdiscountedRetailPrice);
  }

  int get getqty => qty;

  set setqty(int value) => qty = value;

  bool get isthiscanBarter => canBarter;

  set setasthiscanBarter(bool value) => canBarter = value;
}
