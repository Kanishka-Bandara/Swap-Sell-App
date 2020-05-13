import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  int id;
  int userId;
  int typeId;
  AddressType type;
  String name;
  String poCode;
  String poArea;
  String street;
  String city;
  String district;
  String province;
  String country;
  bool isDefaultAddress;
  int state;

  Address({
    @required this.id,
    @required this.userId,
    @required this.typeId,
    @required this.type,
    @required this.name,
    @required this.poCode,
    @required this.poArea,
    @required this.street,
    @required this.city,
    @required this.district,
    @required this.province,
    @required this.country,
    @required this.isDefaultAddress,
    @required this.state,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getUserId => userId;

  set setUserId(int userId) => this.userId = userId;

  int get getAddressTypeId => typeId;

  set setAddressTypeId(int typeId) => this.typeId = typeId;

  AddressType get getAddressType => type;

  set setAddressType(AddressType type) => this.type = type;

  String get getName => name;

  set setName(String name) => this.name = name;

  String get getPostalCode => poCode;

  set setPostalCode(String poCode) => this.poCode = poCode;

  String get getPostalArea => poArea;

  set setPostalArea(String poArea) => this.poArea = poArea;

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

  bool get getIsDefaultAddress => isDefaultAddress;

  set setIsDefaultAddress(bool isDefaultAddress) =>
      this.isDefaultAddress = isDefaultAddress;

  int get getState => state;

  set setState(int state) => this.state = state;

  String get getAsString {
    String a = "";
    if (this.getName != null || this.getName.isNotEmpty) {
      a += this.getName + ",\n";
    }
    if (this.getPostalCode != null || this.getPostalCode.isNotEmpty) {
      a += this.getPostalCode + ",\n";
    }
    if (this.getPostalArea != null || this.getPostalArea.isNotEmpty) {
      a += this.getPostalArea + ",\n";
    }
    if (this.getStreet != null || this.getStreet.isNotEmpty) {
      a += this.getStreet + ",\n";
    }
    if (this.getCity != null || this.getCity.isNotEmpty) {
      a += this.getCity + ",\n";
    }
    if (this.getDistrict != null || this.getDistrict.isNotEmpty) {
      a += this.getDistrict + ",\n";
    }
    if (this.province != null || this.province.isNotEmpty) {
      a += this.province + ",\n";
    }
    if (this.country != null || this.country.isNotEmpty) {
      a += this.country + ",\n";
    }
    return a;
  }
  
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
