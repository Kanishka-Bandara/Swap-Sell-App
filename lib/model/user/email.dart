import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';

part 'email.g.dart';

@JsonSerializable()
class Email {
  int id;
  int emailTypeId;
  EmailType emailType;
  String email;
  bool isDefault;
  int userId;
  int status;
  Email({
    @required this.id,
    @required this.emailTypeId,
    @required this.emailType,
    @required this.email,
    @required this.isDefault,
    @required this.userId,
    @required this.status,
  });

  int get getEmailID => id;

  set setEmailID(int id) => this.id = id;

  EmailType get getEmailType => emailType;

  set setEmailType(EmailType emailType) => this.emailType = emailType;

  int get getEmailTypeId => emailTypeId;

  set setEmailTypeId(int emailTypeId) => this.emailTypeId = emailTypeId;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  bool get getIsDefault => isDefault;

  set setIsDefault(bool isDefault) => this.isDefault = isDefault;

  int get getUserId => userId;

  set setUserId(int userId) => this.userId = userId;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
