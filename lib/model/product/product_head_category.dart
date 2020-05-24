import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product_main_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_head_category.g.dart';

@JsonSerializable(explicitToJson: true)
class HeadCategory {
  int catID;
  String catName;
  String imgPath;
  List<MainCategory> mainCategories;

  int get getCatID => catID;

  HeadCategory(this.catID, this.catName, this.imgPath);

  set setCatID(int catID) => this.catID = catID;

  String get getCatName => catName;

  set setCatName(String catName) => this.catName = catName;

  String get getImgPath => imgPath;

  set setImgPath(String imgPath) => this.imgPath = imgPath;

  Image get getNetworkImage => Image.network(this.getImgPath);

  set setMainCategories(List<MainCategory> mainCategories) =>
      this.mainCategories = mainCategories;

  List<MainCategory> get getMainCategories => this.mainCategories;

  factory HeadCategory.fromJson(Map<String, dynamic> json) => _$HeadCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$HeadCategoryToJson(this);

}
