// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    id: json['id'] as int,
    userId: json['userId'] as int,
    typeId: json['typeId'] as int,
    type: _$enumDecodeNullable(_$AddressTypeEnumMap, json['type']),
    name: json['name'] as String,
    poCode: json['poCode'] as String,
    poArea: json['poArea'] as String,
    street: json['street'] as String,
    city: json['city'] as String,
    district: json['district'] as String,
    province: json['province'] as String,
    country: json['country'] as String,
    isDefaultAddress: json['isDefaultAddress'] as bool,
    state: json['state'] as int,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'typeId': instance.typeId,
      'type': _$AddressTypeEnumMap[instance.type],
      'name': instance.name,
      'poCode': instance.poCode,
      'poArea': instance.poArea,
      'street': instance.street,
      'city': instance.city,
      'district': instance.district,
      'province': instance.province,
      'country': instance.country,
      'isDefaultAddress': instance.isDefaultAddress,
      'state': instance.state,
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

const _$AddressTypeEnumMap = {
  AddressType.ignore: 'ignore',
  AddressType.BILLING: 'BILLING',
  AddressType.DELIVERY: 'DELIVERY',
};
