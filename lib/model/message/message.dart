import 'package:flutter/material.dart';

abstract class Message {
  int id;
  String category;
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

  String get getCategory => category;

  set setCategory(String category) => this.category = category;

  String get getMessage => message;

  set setMessage(String message) => this.message = message;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
