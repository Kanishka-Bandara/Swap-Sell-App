import 'package:flutter/material.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';

class Email {

  int emailID;
  EmailType emailType;
  String email;
  bool isDefault;
  int status;
  Email({
    @required this.emailID,
    @required this.emailType,
    @required this.email,
    @required this.isDefault,
    @required this.status,
  });

  int get getEmailID => emailID;

  set setEmailID(int emailID) => this.emailID = emailID;

  EmailType get getEmailType => emailType;

  set setEmailType(EmailType emailType) => this.emailType = emailType;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  bool get getIsDefault => isDefault;

  set setIsDefault(bool isDefault) => this.isDefault = isDefault;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
