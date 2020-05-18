import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';

class LocationDetailsManagerAPI {
  static LocationDetailsManagerAPI defaultManager = LocationDetailsManagerAPI();
  Future<List<Map<String, String>>> getAllCountries() async {
    List<Map<String, String>> c = [];
    var response = await http.get(URLHolder.ALL_COUNTRY_LIST_URL);
    if (response.statusCode == 200) {
      var x = await jsonDecode(response.body);
      for (var i = 0; i < x.length; i++) {
        Map<String, String> m = {};
        m["id"] = x[i]["id"];
        m["country"] = x[i]["country"];
        c.add(m);
      }
    }
    return c;
  }

  Future<List<Map<String, String>>> getProvincesByCountry(
      String country) async {
    Map<String, String> request = {};
    request["country"] = country;
    List<Map<String, String>> c = [];
    var response = await http.post(
      URLHolder.ALL_PROVINCE_LIST_BY_COUNTRY_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request),
    );
    if (response.statusCode == 200) {
      var x = await jsonDecode(response.body);
      for (var i = 0; i < x.length; i++) {
        Map<String, String> m = {};
        m["id"] = x[i]["id"];
        m["province"] = x[i]["province"];
        c.add(m);
      }
    }
    return c;
  }

  Future<List<Map<String, String>>> getDistrictsByProvince(
      String province) async {
    Map<String, String> request = {};
    request["province"] = province;
    List<Map<String, String>> c = [];
    var response = await http.post(
      URLHolder.ALL_DISTRICT_LIST_BY_PROVINCE_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request),
    );
    if (response.statusCode == 200) {
      var x = await jsonDecode(response.body);
      print(x);
      for (var i = 0; i < x.length; i++) {
        Map<String, String> m = {};
        m["id"] = x[i]["id"];
        m["district"] = x[i]["district"];
        c.add(m);
      }
    }
    return c;
  }

  Future<List<Map<String, String>>> getPOBoxByDistrict(String district) async {
    Map<String, String> request = {};
    request["district"] = district;
    List<Map<String, String>> c = [];
    var response = await http.post(
      URLHolder.ALL_POSTAL_CODE_LIST_BY_DISTRICT_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request),
    );
    if (response.statusCode == 200) {
      var x = await jsonDecode(response.body);
      for (var i = 0; i < x.length; i++) {
        Map<String, String> m = {};
        m["id"] = x[i]["id"];
        m["code"] = x[i]["code"];
        m["area"] = x[i]["area"];
        c.add(m);
      }
    }
    return c;
  }
}
