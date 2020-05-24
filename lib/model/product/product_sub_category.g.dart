// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return SubCategory(
    json['catID'] as int,
    json['catName'] as String,
    json['imgPath'] as String,
  )..mainCategory = json['mainCategory'] == null
      ? null
      : MainCategory.fromJson(json['mainCategory'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'catID': instance.catID,
      'catName': instance.catName,
      'imgPath': instance.imgPath,
      'mainCategory': instance.mainCategory?.toJson(),
    };
