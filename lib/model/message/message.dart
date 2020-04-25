import 'package:flutter/material.dart';
import 'package:swap_sell/model/message/message_metadata.dart';

class Message {
  int id;
  MessageType category;
  String message;
  DateTime sentAt;
  DateTime viewedAt;
  MessageStatus status;
  bool read;

  Message({
    @required this.id,
    @required this.category,
    @required this.message,
    @required this.read,
    @required this.viewedAt,
    @required this.sentAt,
    @required this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  MessageType get getCategory => category;

  set setCategory(MessageType category) => this.category = category;

  String get getMessage => message;

  set setMessage(String message) => this.message = message;

  MessageStatus get getStatus => status;

  set setStatus(MessageStatus status) => this.status = status;

  bool get isRead => read;

  set setIsRead(bool read) => this.read = read;

  DateTime get getSentAt => this.sentAt;

  set setSentAt(DateTime sentTime) => this.sentAt = sentTime;

  DateTime get getViewedAt => this.sentAt;

  set setViewedAt(DateTime viewdTime) => this.sentAt = viewdTime;
}
