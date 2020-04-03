import 'package:flutter/material.dart';

class Email {
  int emailID;
  String emailType;
  String email;
  int status;
  Email({
    @required this.emailID,
    @required this.emailType,
    @required this.email,
    @required this.status,
  });

  int get getEmailID => emailID;

  set setEmailID(int emailID) => this.emailID = emailID;

  String get getEmailType => emailType;

  set setEmailType(String emailType) => this.emailType = emailType;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
