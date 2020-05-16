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
}
