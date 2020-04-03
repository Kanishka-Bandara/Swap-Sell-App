import 'package:flutter/material.dart';
import 'package:swap_sell/model/user/address.dart';
import 'package:swap_sell/model/user/contact_number.dart';
import 'package:swap_sell/model/user/email.dart';

class User {
  int id;
  String userId;
  String title;
  String gender;
  String fName;
  String lName;
  String sName;
  String fullName;
  int activeState;
  List<Email> emails;
  String country;
  String note;
  String profilePicUrl;
  List<Address> addresses = [];
  List<ContactNumber> contactNumbers = [];
  int status;

  User({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.gender,
    @required this.fName,
    @required this.lName,
    this.sName,
    @required this.fullName,
    @required this.activeState,
    @required this.emails,
    @required this.country,
    this.note,
    this.profilePicUrl,
    this.addresses,
    this.contactNumbers,
    @required this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getUserId => userId;

  set setUserId(String userId) => this.userId = userId;

  String get getTitle => title;

  set setTitle(String title) => this.title = title;

  String get getGender => gender;

  set setGender(String gender) => this.gender = gender;

  String get getFName => fName;

  set setFName(String fName) => this.fName = fName;

  String get getLName => lName;

  set setLName(String lName) => this.lName = lName;

  String get getSName => sName;

  set setSName(String sName) => this.sName = sName;

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

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}