import 'package:flutter/material.dart';
import 'package:swap_sell/api_manager/location_details_api_manager.dart';

class LocationDetailsController {
  static LocationDetailsController defaultcontroller =
      LocationDetailsController();

  Future<List<DropdownMenuItem<String>>> getCountryList() async {
    List<DropdownMenuItem<String>> rl = [];
    var l = await LocationDetailsManagerAPI.defaultManager.getAllCountries();
    l.forEach((m) {
      rl.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Text(m["country"]),
            ],
          ),
          value: m["country"],
        ),
      );
    });
    return rl;
  }
  Future<List<DropdownMenuItem<String>>> getProvinceListByCountry(String country) async {
    List<DropdownMenuItem<String>> rl = [];
    var l = await LocationDetailsManagerAPI.defaultManager.getProvincesByCountry(country);
    l.forEach((m) {
      rl.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Text(m["province"]),
            ],
          ),
          value: m["province"],
        ),
      );
    });
    return rl;
  }
  Future<List<DropdownMenuItem<String>>> getDistrictListByProvince(String province) async {
    List<DropdownMenuItem<String>> rl = [];
    var l = await LocationDetailsManagerAPI.defaultManager.getDistrictsByProvince(province);
    l.forEach((m) {
      rl.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Text(m["district"]),
            ],
          ),
          value: m["district"],
        ),
      );
    });
    return rl;
  }
  Future<List<DropdownMenuItem<String>>> getPOBoxListByDistrict(String district) async {
    List<DropdownMenuItem<String>> rl = [];
    var l = await LocationDetailsManagerAPI.defaultManager.getPOBoxByDistrict(district);
    l.forEach((m) {
      rl.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Text(m["area"]),
            ],
          ),
          value: m["code"],
        ),
      );
    });
    return rl;
  }
}
