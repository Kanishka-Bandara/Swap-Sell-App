import 'package:flutter/cupertino.dart';

class Category {
  int catID;
  String catName;
  String imgPath;
  int get getCatID => catID;

  Category(this.catID, this.catName, this.imgPath);

  set setCatID(int catID) => this.catID = catID;

  String get getCatName => catName;

  set setCatName(String catName) => this.catName = catName;

  String get getImgPath => imgPath;

  set setImgPath(String imgPath) => this.imgPath = imgPath;

  Image get getNetworkImage => Image.network(this.getImgPath);
}