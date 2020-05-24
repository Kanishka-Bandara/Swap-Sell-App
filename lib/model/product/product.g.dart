// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    uniqueID: json['uniqueID'] as String,
    name: json['name'] as String,
    retailPrice: (json['retailPrice'] as num)?.toDouble(),
    barterPrice: (json['barterPrice'] as num)?.toDouble(),
    deliveryPrice: (json['deliveryPrice'] as num)?.toDouble(),
    discountPrice: (json['discountPrice'] as num)?.toDouble(),
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
    barcode: json['barcode'] as String,
    inTheBox: json['inTheBox'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    qty: json['qty'] as int,
    specifications: (json['specifications'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    saleCount: json['saleCount'] as int,
    barterCount: json['barterCount'] as int,
    returnCount: json['returnCount'] as int,
    headCategory: json['headCategory'] as String,
    mainCategory: json['mainCategory'] as String,
    subCategory: json['subCategory'] as String,
    condition:
        _$enumDecodeNullable(_$ProductConditionEnumMap, json['condition']),
    model: json['model'] as String,
    brand: json['brand'] as String,
    shop: json['shop'] == null
        ? null
        : Shop.fromJson(json['shop'] as Map<String, dynamic>),
    isFavorite: json['isFavorite'] as int,
    currency: json['currency'] as String,
    dealingState:
        _$enumDecodeNullable(_$ProductDealingTypeEnumMap, json['dealingState']),
    headCategoryId: json['headCategoryId'] as int,
    mainCategoryId: json['mainCategoryId'] as int,
    subCategoryId: json['subCategoryId'] as int,
    brandId: json['brandId'] as int,
    conditionId: json['conditionId'] as int,
    currencyId: json['currencyId'] as int,
    dealingStateId: json['dealingStateId'] as int,
    discountId: json['discountId'] as int,
  )..status = json['status'] as int;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'uniqueID': instance.uniqueID,
      'name': instance.name,
      'headCategoryId': instance.headCategoryId,
      'mainCategoryId': instance.mainCategoryId,
      'subCategoryId': instance.subCategoryId,
      'headCategory': instance.headCategory,
      'mainCategory': instance.mainCategory,
      'subCategory': instance.subCategory,
      'model': instance.model,
      'brandId': instance.brandId,
      'brand': instance.brand,
      'images': instance.images,
      'description': instance.description,
      'barcode': instance.barcode,
      'specifications': instance.specifications,
      'conditionId': instance.conditionId,
      'condition': _$ProductConditionEnumMap[instance.condition],
      'inTheBox': instance.inTheBox,
      'rating': instance.rating,
      'qty': instance.qty,
      'currencyId': instance.currencyId,
      'currency': instance.currency,
      'dealingStateId': instance.dealingStateId,
      'dealingState': _$ProductDealingTypeEnumMap[instance.dealingState],
      'barterPrice': instance.barterPrice,
      'retailPrice': instance.retailPrice,
      'deliveryPrice': instance.deliveryPrice,
      'discountId': instance.discountId,
      'discountPrice': instance.discountPrice,
      'saleCount': instance.saleCount,
      'barterCount': instance.barterCount,
      'returnCount': instance.returnCount,
      'shop': instance.shop?.toJson(),
      'isFavorite': instance.isFavorite,
      'status': instance.status,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ProductConditionEnumMap = {
  ProductCondition.BRAND_NEW: 'BRAND_NEW',
  ProductCondition.USED: 'USED',
};

const _$ProductDealingTypeEnumMap = {
  ProductDealingType.ONLY_SELL: 'ONLY_SELL',
  ProductDealingType.ONLY_BARTER: 'ONLY_BARTER',
  ProductDealingType.BARTER_AND_SELL: 'BARTER_AND_SELL',
};
