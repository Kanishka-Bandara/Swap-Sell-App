// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) {
  return Email(
    id: json['id'] as int,
    emailTypeId: json['emailTypeId'] as int,
    emailType: _$enumDecodeNullable(_$EmailTypeEnumMap, json['emailType']),
    email: json['email'] as String,
    isDefault: json['isDefault'] as int,
    userId: json['userId'] as int,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'id': instance.id,
      'emailTypeId': instance.emailTypeId,
      'emailType': _$EmailTypeEnumMap[instance.emailType],
      'email': instance.email,
      'isDefault': instance.isDefault,
      'userId': instance.userId,
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

const _$EmailTypeEnumMap = {
  EmailType.ignore: 'ignore',
  EmailType.BILLING: 'BILLING',
  EmailType.OFFICIAL: 'OFFICIAL',
  EmailType.BUSINESS: 'BUSINESS',
};
