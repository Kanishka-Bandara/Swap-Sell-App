// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_head_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadCategory _$HeadCategoryFromJson(Map<String, dynamic> json) {
  return HeadCategory(
    json['catID'] as int,
    json['catName'] as String,
    json['imgPath'] as String,
  )..mainCategories = (json['mainCategories'] as List)
      ?.map((e) =>
          e == null ? null : MainCategory.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$HeadCategoryToJson(HeadCategory instance) =>
    <String, dynamic>{
      'catID': instance.catID,
      'catName': instance.catName,
      'imgPath': instance.imgPath,
      'mainCategories':
          instance.mainCategories?.map((e) => e?.toJson())?.toList(),
    };
