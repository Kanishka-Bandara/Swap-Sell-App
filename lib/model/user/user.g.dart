// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    userId: json['userId'] as String,
    userType: _$enumDecodeNullable(_$UserTypeEnumMap, json['userType']),
    title: json['title'] as String,
    gender: json['gender'] as String,
    fName: json['fName'] as String,
    lName: json['lName'] as String,
    sName: json['sName'] as String,
    fullName: json['fullName'] as String,
    activeState: json['activeState'] as int,
    emails: (json['emails'] as List)
        ?.map(
            (e) => e == null ? null : Email.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    country: json['country'] as String,
    note: json['note'] as String,
    profilePicUrl: json['profilePicUrl'] as String,
    addresses: (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    contactNumbers: (json['contactNumbers'] as List)
        ?.map((e) => e == null
            ? null
            : ContactNumber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    username: json['username'] as String,
    password: json['password'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userType': _$UserTypeEnumMap[instance.userType],
      'title': instance.title,
      'gender': instance.gender,
      'fName': instance.fName,
      'lName': instance.lName,
      'sName': instance.sName,
      'fullName': instance.fullName,
      'activeState': instance.activeState,
      'emails': instance.emails?.map((e) => e?.toJson())?.toList(),
      'country': instance.country,
      'note': instance.note,
      'profilePicUrl': instance.profilePicUrl,
      'addresses': instance.addresses?.map((e) => e?.toJson())?.toList(),
      'contactNumbers':
          instance.contactNumbers?.map((e) => e?.toJson())?.toList(),
      'username': instance.username,
      'password': instance.password,
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

const _$UserTypeEnumMap = {
  UserType.ignore: 'ignore',
  UserType.SELLER: 'SELLER',
  UserType.BUYER: 'BUYER',
  UserType.SELLER_AND_BUYER: 'SELLER_AND_BUYER',
};
