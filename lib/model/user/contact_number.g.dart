// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactNumber _$ContactNumberFromJson(Map<String, dynamic> json) {
  return ContactNumber(
    id: json['id'] as int,
    contactNumberTypeId: json['contactNumberTypeId'] as int,
    contactNumberType: _$enumDecodeNullable(
        _$ContactNumberTypeEnumMap, json['contactNumberType']),
    contactNumber: json['contactNumber'] as String,
    isDefault: json['isDefault'] as int,
    userId: json['userId'] as int,
    state: json['state'] as int,
  );
}

Map<String, dynamic> _$ContactNumberToJson(ContactNumber instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contactNumberTypeId': instance.contactNumberTypeId,
      'contactNumberType':
          _$ContactNumberTypeEnumMap[instance.contactNumberType],
      'contactNumber': instance.contactNumber,
      'isDefault': instance.isDefault,
      'userId': instance.userId,
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

const _$ContactNumberTypeEnumMap = {
  ContactNumberType.ignore: 'ignore',
  ContactNumberType.OFFICIAL: 'OFFICIAL',
  ContactNumberType.PRIVATE: 'PRIVATE',
};
