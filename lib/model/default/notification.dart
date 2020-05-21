import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(explicitToJson: true)
class Notification {
  int id;
  String notificationHeader;
  String notification;
  DateTime date;
  int isRead = 1;
  int state;
  Notification({
    @required this.id,
    @required this.notificationHeader,
    @required this.notification,
    @required this.isRead,
    this.state,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getNotificationHeader => notificationHeader;

  set setNotificationHeader(String notificationHeader) =>
      this.notificationHeader = notificationHeader;

  String get getNotification => notification;

  set setNotification(String notification) => this.notification = notification;

  bool get getIsRead => isRead == 1;

  set setIsRead(bool isRead) => isRead ? this.isRead = 1 : this.isRead = 0;

  int get getState => state;

  set setState(int state) => this.state = state;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
