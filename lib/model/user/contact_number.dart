import 'package:flutter/material.dart';

class ContactNumber {
  int contactNumberID;
  String contactNumberType;
  String contactNumber;
  bool isPrimary;

  ContactNumber({
    @required this.contactNumberID,
    @required this.contactNumberType,
    @required this.contactNumber,
    @required this.isPrimary,
  });

  int get getContactNumberID => contactNumberID;

  set setContactNumberID(int contactNumberID) =>
      this.contactNumberID = contactNumberID;

  String get getContactNumberType => contactNumberType;

  set setContactNumberType(String contactNumberType) =>
      this.contactNumberType = contactNumberType;

  String get getContactNumber => contactNumber;

  set setContactNumber(String contactNumber) =>
      this.contactNumber = contactNumber;

  bool get getIsPrimary => isPrimary;

  set setIsPrimary(bool isPrimary) => this.isPrimary = isPrimary;
}
