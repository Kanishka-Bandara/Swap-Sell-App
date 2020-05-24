// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wished_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishedProduct _$WishedProductFromJson(Map<String, dynamic> json) {
  return WishedProduct(
    id: json['id'] as int,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    savedAt: json['savedAt'] == null
        ? null
        : DateTime.parse(json['savedAt'] as String),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$WishedProductToJson(WishedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product?.toJson(),
      'savedAt': instance.savedAt?.toIso8601String(),
      'status': instance.status,
    };
