import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swap_sell/model/user/address.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/contact_number.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  int id;
  String userId;
  UserType userType;
  String title;
  String gender;
  String fname;
  String lname;
  String sname;
  String fullName;
  int activeState;
  List<Email> emails;
  String country;
  String note;
  String profilePicUrl;
  List<Address> addresses = [];
  List<ContactNumber> contactNumbers = [];
  String username;
  String password;
  int status;

  User({
    @required this.id,
    @required this.userId,
    @required this.userType,
    @required this.title,
    @required this.gender,
    @required this.fname,
    @required this.lname,
    this.sname,
    @required this.fullName,
    @required this.activeState,
    @required this.emails,
    @required this.country,
    this.note,
    this.profilePicUrl,
    this.addresses,
    this.contactNumbers,
    this.username,
    this.password,
    @required this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getUserId => userId;

  set setUserId(String userId) => this.userId = userId;

  UserType get getUserType => userType;

  set setUserType(UserType userType) => this.userType = userType;

  String get getTitle => title;

  set setTitle(String title) => this.title = title;

  String get getGender => gender;

  set setGender(String gender) => this.gender = gender;

  String get getFName => fname;

  set setFName(String fname) => this.fname = fname;

  String get getLName => lname;

  set setLName(String lname) => this.lname = lname;

  String get getSName => sname;

  set setSName(String sname) => this.sname = sname;

  String get getFullName => fullName;

  set setFullName(String fullName) => this.fullName = fullName;

  int get getActiveState => activeState;

  set setActiveState(int activeState) => this.activeState = activeState;

  String get getCountry => country;

  set setCountry(String country) => this.country = country;

  String get getNote => note;

  set setNote(String note) => this.note = note;

  String get getProfilePicUrl => profilePicUrl;

  set setProfilePicUrl(String profilePicUrl) =>
      this.profilePicUrl = profilePicUrl;

  List<Address> get getAddresses => this.addresses;

  set setAddresses(List<Address> addresses) => this.addresses = addresses;

  List<ContactNumber> get getContactNumbers => this.contactNumbers;

  set setContactNumbers(List<ContactNumber> contactNumbers) =>
      this.contactNumbers = contactNumbers;

  List<Email> get getEmails => this.emails;

  set setEmails(List<Email> emails) => this.emails = emails;

  String get getUsername => username;

  set setUsername(String username) => this.username = username;

  String get getPassword => password;

  set setPassword(String password) => this.password = password;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  Email getDefaultEmail(EmailType type) {
    Email e;
    this.getEmails.forEach((v) {
      if (v.getEmailType == type) {
        if (v.getIsDefault==1) {
          e = v;
        }
      }
    });
    return e;
  }

  Address getDefaultAddress(AddressType type) {
    Address e;
    this.getAddresses.forEach((v) {
      if (v.getAddressType == type) {
        if (v.getIsDefaultAddress==1) {
          e = v;
        }
      }
    });
    return e;
  }

  ContactNumber getDefaultContactNumber(ContactNumberType type) {
    ContactNumber e;
    this.getContactNumbers.forEach((v) {
      if (v.getContactNumberType == type) {
        if (v.getIsDefault==1) {
          e = v;
        }
      }
    });
    return e;
  }

  User get getClone {
    User u = new User(
      id: this.getId,
      userId: this.getUserId,
      userType: this.userType,
      title: this.getTitle,
      gender: this.getGender,
      fname: this.getFName,
      lname: this.getLName,
      fullName: this.getFullName,
      activeState: this.getActiveState,
      emails: this.getEmails,
      country: this.getCountry,
      status: this.getStatus,
      sname: this.getSName,
      note: this.getNote,
      profilePicUrl: this.getProfilePicUrl,
      addresses: this.getAddresses,
      contactNumbers: this.getContactNumbers,
      username: this.getUsername,
      password: this.getPassword,
    );
    return u;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}
