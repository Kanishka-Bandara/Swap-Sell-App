import 'package:flutter/material.dart';

class Address {
  int id;
  String type;
  String name;
  String poBox;
  String street;
  String city;
  String district;
  String province;
  String country;
  bool isPrimaryAddress;
  int state;

  Address({
    @required this.id,
    @required this.type,
    @required this.name,
    @required this.poBox,
    @required this.street,
    @required this.city,
    @required this.district,
    @required this.province,
    @required this.country,
    @required this.isPrimaryAddress,
    @required this.state,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getType => type;

  set setType(String type) => this.type = type;

  String get getName => name;

  set setName(String name) => this.name = name;

  String get getPoBox => poBox;

  set setPoBox(String poBox) => this.poBox = poBox;

  String get getStreet => street;

  set setStreet(String street) => this.street = street;

  String get getCity => city;

  set setCity(String city) => this.city = city;

  String get getDistrict => district;

  set setDistrict(String district) => this.district = district;

  String get getProvince => province;

  set setProvince(String province) => this.province = province;

  String get getCountry => country;

  set setCountry(String country) => this.country = country;

  bool get getIsPrimaryAddress => isPrimaryAddress;

  set setIsPrimaryAddress(bool isPrimaryAddress) =>
      this.isPrimaryAddress = isPrimaryAddress;

  int get getState => state;

  set setState(int state) => this.state = state;
}
