import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product_head_category.dart';
import 'package:swap_sell/model/product/product_sub_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_main_category.g.dart';

@JsonSerializable(explicitToJson: true)
class MainCategory {
  int catID;
  String catName;
  String imgPath;
  HeadCategory headCategory;
  List<SubCategory> subCategories;

  int get getCatID => catID;

  MainCategory(this.catID, this.catName, this.imgPath);

  set setCatID(int catID) => this.catID = catID;

  String get getCatName => catName;

  set setCatName(String catName) => this.catName = catName;

  String get getImgPath => imgPath;

  set setImgPath(String imgPath) => this.imgPath = imgPath;

  Image get getNetworkImage => Image.network(this.getImgPath);

  set setHeadCategory(HeadCategory headCategory) =>
      this.headCategory = headCategory;

  HeadCategory get getHeadCategory => headCategory;

  set setSubCategories(List<SubCategory> subCategories) =>
      this.subCategories = subCategories;

  List<SubCategory> get getSubCategories => this.subCategories;

  factory MainCategory.fromJson(Map<String, dynamic> json) => _$MainCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MainCategoryToJson(this);

}
