// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_main_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainCategory _$MainCategoryFromJson(Map<String, dynamic> json) {
  return MainCategory(
    json['catID'] as int,
    json['catName'] as String,
    json['imgPath'] as String,
  )
    ..headCategory = json['headCategory'] == null
        ? null
        : HeadCategory.fromJson(json['headCategory'] as Map<String, dynamic>)
    ..subCategories = (json['subCategories'] as List)
        ?.map((e) =>
            e == null ? null : SubCategory.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MainCategoryToJson(MainCategory instance) =>
    <String, dynamic>{
      'catID': instance.catID,
      'catName': instance.catName,
      'imgPath': instance.imgPath,
      'headCategory': instance.headCategory?.toJson(),
      'subCategories':
          instance.subCategories?.map((e) => e?.toJson())?.toList(),
    };
