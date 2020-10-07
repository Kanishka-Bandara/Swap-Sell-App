import 'package:flutter/material.dart';
import 'package:swap_sell/model/message/message_metadata.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  int id;
  int categoryId;
  MessageType category;
  String message;
  DateTime sentAt;
  DateTime viewedAt;
  int messageStatusId;
  MessageStatus messageStatus;
  int read;
  int status;

  Message({
    @required this.id,
    @required this.categoryId,
    @required this.category,
    @required this.message,
    @required this.read,
    @required this.viewedAt,
    @required this.sentAt,
    @required this.messageStatusId,
    @required this.messageStatus,
    @required this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getMessageTypeId => categoryId;

  set setMessageTypeId(int categoryId) => this.categoryId = categoryId;

  MessageType get getCategory => category;

  set setCategory(MessageType category) => this.category = category;

  String get getMessage => message;

  set setMessage(String message) => this.message = message;

  int get getMessageStatusId => messageStatusId;

  set setMessageStatusId(int messageStatusId) =>
      this.messageStatusId = messageStatusId;

  MessageStatus get getMessageStatus => messageStatus;

  set setMessageStatus(MessageStatus messageStatus) =>
      this.messageStatus = messageStatus;

  bool get isRead => read == 1;

  set setIsRead(bool read) {
    if (read) {
      this.read = 1;
    } else {
      this.read = 0;
    }
  }

  DateTime get getSentAt => this.sentAt;

  set setSentAt(DateTime sentTime) => this.sentAt = sentTime;

  DateTime get getViewedAt => this.sentAt;

  set setViewedAt(DateTime viewdTime) => this.sentAt = viewdTime;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
