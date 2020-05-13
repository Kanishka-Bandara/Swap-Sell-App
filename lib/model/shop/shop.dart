import 'package:flutter/material.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';

class Shop {
  int id;
  String shopID;
  String shopName;
  User owner;
  String imgUrl;
  double rating;
  int status;

  Shop({
    @required this.id,
    @required this.shopID,
    @required this.shopName,
    @required this.owner,
    this.imgUrl,
    this.rating,
    @required this.status,
  });

  static Shop exampleShop = Shop(
    id: 1,
    shopID: "Sh123",
    shopName: "Kanishka's Shop",
    owner: User(
      id: 1,
      userId: "U123456",
      userType: UserType.SELLER_AND_BUYER,
      title: "Mr.",
      gender: "Male",
      fName: "Kanishka",
      lName: "Bandara",
      fullName: "Kanishka Bandara",
      profilePicUrl:
          "https://qph.fs.quoracdn.net/main-raw-215174174-lbogygxumelpceaujmltqhykknchfzku.jpeg",
      sName: "Bandara",
      activeState: 1,
      emails: [
        Email(
          id: 1,
          emailType: EmailType.OFFICIAL,
          email: "kanishka@gmail.com",
          emailTypeId: 1,
          userId: 1,
          isDefault: true,
          status: 1,
        ),
      ],
      country: "Sri Lanka",
      status: 1,
      username: "kanishka123",
      password: "123"
    ),
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

  User get getOwner => owner;

  set setOwner(User owner) => this.owner = owner;

  String get getImgUrl => imgUrl;

  set setImgUrl(String imgUrl) => this.imgUrl = imgUrl;

  double get getRating => rating;

  set setRating(double rating) => this.rating = rating;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
