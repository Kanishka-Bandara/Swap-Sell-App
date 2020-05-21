import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product_main_category.dart';

class SubCategory {
  
  int catID;
  String catName;
  String imgPath;
  MainCategory mainCategory;
  
  int get getCatID => catID;

  SubCategory(this.catID, this.catName, this.imgPath);

  set setCatID(int catID) => this.catID = catID;

  String get getCatName => catName;

  set setCatName(String catName) => this.catName = catName;

  String get getImgPath => imgPath;

  set setImgPath(String imgPath) => this.imgPath = imgPath;

  Image get getNetworkImage => Image.network(this.getImgPath);

  set setHeadCategory(MainCategory mainCategory) => this.mainCategory = mainCategory;

  MainCategory get getHeadCategory => mainCategory;
  
}
