import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shop.g.dart';

@JsonSerializable(explicitToJson: true)
class Shop {
  int id;
  String shopID;
  String shopName;
  int ownerId;
  String imgUrl;
  double rating;
  int status;

  Shop({
    @required this.id,
    @required this.shopID,
    @required this.shopName,
    @required this.ownerId,
    this.imgUrl,
    this.rating,
    @required this.status,
  });

  static Shop exampleShop = Shop(
    id: 1,
    shopID: "Sh123",
    shopName: "Kanishka's Shop",
    ownerId: 1,
    imgUrl:
        "https://lh3.googleusercontent.com/proxy/X8FSIZC1IPsTljed6H_mszGRz55-iHXdTivKxXVJRiebhSKbTbWpufTacXgdPZP9GJCu0iyvnll1sRkcr6vgLwCE-pF_ojdPI_-CoXLkWWCVuqzhWHv7lA",
    rating: 3.8,
    status: 1,
  );

  int get getID => id;

  set setID(int id) => this.id = id;

  String get getShopID => shopID;

  set setShopID(String shopID) => this.shopID = shopID;

  String get getShopName => shopName;

  set setShopName(String shopName) => this.shopName = shopName;

  int get getOwnerId => ownerId;

  set setOwnerId(int ownerId) => this.ownerId = ownerId;

  String get getImgUrl => imgUrl;

  set setImgUrl(String imgUrl) => this.imgUrl = imgUrl;

  double get getRating => rating;

  set setRating(double rating) => this.rating = rating;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
  
  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);

}
