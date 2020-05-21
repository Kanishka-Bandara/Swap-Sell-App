// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) {
  return UserMessage(
    receivedBy: json['receivedBy'] == null
        ? null
        : User.fromJson(json['receivedBy'] as Map<String, dynamic>),
    sentBy: json['sentBy'] == null
        ? null
        : User.fromJson(json['sentBy'] as Map<String, dynamic>),
    messageList: (json['messageList'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'receivedBy': instance.receivedBy?.toJson(),
      'sentBy': instance.sentBy?.toJson(),
      'messageList': instance.messageList?.map((e) => e?.toJson())?.toList(),
    };
