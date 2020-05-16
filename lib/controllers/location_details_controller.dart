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
}
