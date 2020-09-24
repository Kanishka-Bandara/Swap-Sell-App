import 'package:flutter/material.dart';
import 'package:swap_sell/controller/location_details_controller.dart';
import 'package:swap_sell/controller/user/user_controller.dart';
import 'package:swap_sell/ui/widgets/kdrop_down_button.dart';

class UserComponent {
  static Widget buildCountryDropDown(
      BuildContext context, ValueChanged<dynamic> onChanged, dynamic value) {
    print("Country::Start");
    return FutureBuilder(
        future: LocationDetailsController.defaultcontroller.getCountryList(),
        builder: (context, snapshot) {
          if (snapshot == null) {
            print("Country::Null");
            return Container();
          } else {
            print("Country::Return");
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your country"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Country",
            );
          }
        });
  }

  static Widget buildProvinceDropDown(BuildContext context,
      ValueChanged<dynamic> onChanged, dynamic value, String country) {
    return FutureBuilder(
        future: LocationDetailsController.defaultcontroller
            .getProvinceListByCountry(country),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your province"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Province",
            );
          }
        });
  }

  static Widget buildDistrictDropDown(BuildContext context,
      ValueChanged<dynamic> onChanged, dynamic value, String province) {
    return FutureBuilder(
        future: LocationDetailsController.defaultcontroller
            .getDistrictListByProvince(province),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your district"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "District",
            );
          }
        });
  }

  static Widget buildPOBoxDropDown(BuildContext context,
      ValueChanged<dynamic> onChanged, dynamic value, String district) {
    return FutureBuilder(
        future: LocationDetailsController.defaultcontroller
            .getPOBoxListByDistrict(district),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your postal area"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Postal Area",
            );
          }
        });
  }

  static Widget buildUserTitleDropDown(
      BuildContext comntext, ValueChanged<dynamic> onChanged, dynamic value) {
    return FutureBuilder(
        future: UserController.defaultUserController.getUserTitleList(),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your title"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Title",
            );
          }
        });
  }

  static Widget buildGenderDropDown(
      BuildContext comntext, ValueChanged<dynamic> onChanged, dynamic value) {
    return FutureBuilder(
        future: UserController.defaultUserController.getGenderList(),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your gender"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Gender",
            );
          }
        });
  }
}
