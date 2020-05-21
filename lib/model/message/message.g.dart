// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    categoryId: json['categoryId'] as int,
    category: _$enumDecodeNullable(_$MessageTypeEnumMap, json['category']),
    message: json['message'] as String,
    read: json['read'] as int,
    viewedAt: json['viewedAt'] == null
        ? null
        : DateTime.parse(json['viewedAt'] as String),
    sentAt: json['sentAt'] == null
        ? null
        : DateTime.parse(json['sentAt'] as String),
    messageStatusId: json['messageStatusId'] as int,
    messageStatus:
        _$enumDecodeNullable(_$MessageStatusEnumMap, json['messageStatus']),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'category': _$MessageTypeEnumMap[instance.category],
      'message': instance.message,
      'sentAt': instance.sentAt?.toIso8601String(),
      'viewedAt': instance.viewedAt?.toIso8601String(),
      'messageStatusId': instance.messageStatusId,
      'messageStatus': _$MessageStatusEnumMap[instance.messageStatus],
      'read': instance.read,
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

const _$MessageTypeEnumMap = {
  MessageType.RECEIVED_MESSAGE: 'RECEIVED_MESSAGE',
  MessageType.SENT_MESSAGE: 'SENT_MESSAGE',
};

const _$MessageStatusEnumMap = {
  MessageStatus.LIVE_MESSAGE: 'LIVE_MESSAGE',
  MessageStatus.ARCHIVE_MESSAGE: 'ARCHIVE_MESSAGE',
};
