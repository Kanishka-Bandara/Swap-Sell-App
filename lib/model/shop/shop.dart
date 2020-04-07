import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/user/user.dart';

class Shop {
  int shopID;
  String shopName;
  User owner;
  String imgUrl;
  List<Product> products;
  int rating;
  int status;

  Shop({
    @required this.shopID,
    @required this.shopName,
    @required this.owner,
    this.imgUrl,
    this.rating,
    this.products,
    @required this.status,
  });

  int get getShopID => shopID;

  set setShopID(int shopID) => this.shopID = shopID;

  String get getShopName => shopName;

  set setShopName(String shopName) => this.shopName = shopName;

  User get getOwner => owner;

  set setOwner(User owner) => this.owner = owner;

  String get getImgUrl => imgUrl;

  set setImgUrl(String imgUrl) => this.imgUrl = imgUrl;

  List<Product> get getproducts => products;

  set setproducts(List<Product> products) => this.products = products;

  List get getProducts => products;

  set setProducts(List products) => this.products = products;

  int get getRating => rating;

  set setRating(int rating) => this.rating = rating;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
