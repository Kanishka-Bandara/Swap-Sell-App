// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    id: json['id'] as int,
    shopID: json['shopID'] as String,
    shopName: json['shopName'] as String,
    ownerId: json['ownerId'] as int,
    imgUrl: json['imgUrl'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'shopID': instance.shopID,
      'shopName': instance.shopName,
      'ownerId': instance.ownerId,
      'imgUrl': instance.imgUrl,
      'rating': instance.rating,
      'status': instance.status,
    };
