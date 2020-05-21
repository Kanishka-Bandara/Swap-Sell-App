import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product_head_category.dart';

class MainCategory {
  int catID;
  String catName;
  String imgPath;
  HeadCategory headCategory;
  
  int get getCatID => catID;

  MainCategory(this.catID, this.catName, this.imgPath);

  set setCatID(int catID) => this.catID = catID;

  String get getCatName => catName;

  set setCatName(String catName) => this.catName = catName;

  String get getImgPath => imgPath;

  set setImgPath(String imgPath) => this.imgPath = imgPath;

  Image get getNetworkImage => Image.network(this.getImgPath);

  set setHeadCategory(HeadCategory headCategory) => this.headCategory = headCategory;

  HeadCategory get getHeadCategory => headCategory;
  
}
