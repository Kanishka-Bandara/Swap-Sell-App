import 'package:flutter/material.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';

class ContactNumber {
  int id;
  int contactNumberTypeId;
  ContactNumberType contactNumberType;
  String contactNumber;
  bool isDefault;
  int userId;
  int state;

  ContactNumber({
    @required this.id,
    @required this.contactNumberTypeId,
    @required this.contactNumberType,
    @required this.contactNumber,
    @required this.isDefault,
    @required this.userId,
    @required this.state,
  });

  int get getID => id;

  set setID(int contactNumberID) =>
      this.id = contactNumberID;

  ContactNumberType get getContactNumberType => contactNumberType;

  set setContactNumberType(ContactNumberType contactNumberType) =>
      this.contactNumberType = contactNumberType;

  int get getContactNumberTypeId => contactNumberTypeId;

  set setContactNumberTypeId(int contactNumberTypeId) =>
      this.contactNumberTypeId = contactNumberTypeId;

  String get getContactNumber => contactNumber;

  set setContactNumber(String contactNumber) =>
      this.contactNumber = contactNumber;

  bool get getIsDefault => isDefault;

  set setIsDefault(bool isDefault) => this.isDefault = isDefault;

  int get getUserID => userId;

  set setUserID(int userId) => this.userId = userId;

  int get getState => state;

  set setState(int state) => this.state = state;

Map toJson()=>{
  'id':id,
  'contactNumberTypeId':contactNumberTypeId,
  'contactNumberType':ContactNumberType,
  'userId':userId,
  'contactNumber':ContactNumber,
  'isDefault':isDefault,
  'status':state
};

}
