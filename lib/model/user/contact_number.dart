import 'package:flutter/material.dart';

class ContactNumber {
  int id;
  String contactNumberType;
  String contactNumber;
  bool isDefault;
  int state;

  ContactNumber({
    @required this.id,
    @required this.contactNumberType,
    @required this.contactNumber,
    @required this.isDefault,
    @required this.state,
  });

  int get getID => id;

  set setID(int contactNumberID) =>
      this.id = contactNumberID;

  String get getContactNumberType => contactNumberType;

  set setContactNumberType(String contactNumberType) =>
      this.contactNumberType = contactNumberType;

  String get getContactNumber => contactNumber;

  set setContactNumber(String contactNumber) =>
      this.contactNumber = contactNumber;

  bool get getIsDefault => isDefault;

  set setIsDefault(bool isDefault) => this.isDefault = isDefault;
  
  int get getState => state;

  set setState(int state) => this.state = state;
}
