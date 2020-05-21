// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    id: json['id'] as int,
    notificationHeader: json['notificationHeader'] as String,
    notification: json['notification'] as String,
    isRead: json['isRead'] as bool,
    state: json['state'] as int,
  )..date =
      json['date'] == null ? null : DateTime.parse(json['date'] as String);
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationHeader': instance.notificationHeader,
      'notification': instance.notification,
      'date': instance.date?.toIso8601String(),
      'isRead': instance.isRead,
      'state': instance.state,
    };
