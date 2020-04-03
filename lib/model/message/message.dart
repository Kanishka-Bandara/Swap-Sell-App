import 'package:flutter/material.dart';

class Message {
  int id;
  int category;
  String message;
  DateTime sentAt;
  DateTime viewedAt;
  int status;

  Message({
    @required this.id,
    @required this.category,
    @required this.message,
    @required this.viewedAt,
    @required this.sentAt,
    @required this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getCategory => category;

  set setCategory(int category) => this.category = category;

  String get getMessage => message;

  set setMessage(String message) => this.message = message;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  DateTime get getSentAt => this.sentAt;

  set setSentAt(DateTime sentTime) => this.sentAt = sentTime;

  DateTime get getViewedAt => this.sentAt;

  set setViewedAt(DateTime viewdTime) => this.sentAt = viewdTime;
}
